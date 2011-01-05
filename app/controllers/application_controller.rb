class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  protected 

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
end
