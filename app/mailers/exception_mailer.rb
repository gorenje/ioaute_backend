class ExceptionMailer < ActionMailer::Base
  default :from => "exception@2monki.es"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.exception_mailer.send_exception.subject
  #
  def send_exception(exception, publication)
    @exception, @publication = exception, publication
    mail(:to => "gerrit.riessen@gmail.com", 
         :subject => ("[PUBME] [EXP] %s" % (exception.nil? ? "NIL" : exception.message)))
  end
end
