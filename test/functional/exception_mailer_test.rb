require 'test_helper'

class ExceptionMailerTest < ActionMailer::TestCase
  test "send_exception" do
    mail = ExceptionMailer.send_exception
    assert_equal "Send exception", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
