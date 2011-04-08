require File.expand_path('../../test_helper.rb', __FILE__)

class ExceptionMailerTest < ActionMailer::TestCase
  test "send_exception" do
    pub = Factory(:publication)
    mail = ExceptionMailer.send_exception(nil, pub)
    assert_equal "[PUBME] [EXP] NIL", mail.subject
    assert_equal ["gerrit.riessen@gmail.com"], mail.to
    assert_equal ["exception@2monki.es"], mail.from
    
    str = ("ExceptionMailer#send_exception\r\nPublication\r\nID: #{pub.id} "+
           "UUID: #{pub.uuid}\r\nBacktrace:\r\nException was nil\r\n")
    assert_equal str, mail.body.encoded
  end
end
