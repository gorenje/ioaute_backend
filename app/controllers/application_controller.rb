class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  protected 

  ActionMethodLookup = { 
    "unhide"  => "show_it!",
    "hide"    => "hide_it!",
    "lock"    => "lock_it!",
    "edit"    => "begin_edit!",
    "delete"  => "forget_it!",
    "recover" => "undelete_it!",
  } unless defined?(ActionMethodLookup)
  
  def json_action_for(params)
    "%s_%s" % [params[:controller], params[:action]]
  end
  
  def send_off_status(status, msg)
    Rails.logger.error("SendOfError: non-200 error: S: #{status} M: #{msg}") if status != 200
    data = msg.kind_of?(Hash) ? msg : { :error => msg }
    respond_to do |format|
      format.json { render :json => data, :layout => false, :status => status }
      format.xml  { render :xml => data.to_xml, :layout => false, :status => status }
    end
  end

  def send_off_failed(params, msg)
    send_off_status(200, {:status => :failed, :action => json_action_for(params), :msg => msg})
  end

  def send_off_success(params, hsh = {})
    send_off_status(200, hsh.merge({:status => :ok, :action => json_action_for(params)}))
  end
  
  def ensure_user_is_admin
    if current_user && current_user.is_admin?
      return
    end
    redirect_to("/")
  end
  
  ## TODO should use something like this ... this is not really finished since
  ## TODO it doesn't cover the case when we have a publication.
  def handle_exceptions(params)
    yield
  rescue Exception => e
    if Rails.env == "development"
      flash[:alert] = e.message
      Rails.logger.error(e.backtrace.join("\n"))
    else
      if @publication
        ExceptionMailer.send_exception(e, @publication)
      else
        ExceptionMailer.evilness_happened(e, params)
      end.deliver
    end
    render("common/publication_does_not_exist", :layout => "application")
  end
end
