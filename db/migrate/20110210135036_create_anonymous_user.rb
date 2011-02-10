class CreateAnonymousUser < ActiveRecord::Migration
  AnonymousEmail = "anonymous@2monki.es"
  def self.up
    User.create!(:email => AnonymousEmail) if User.find_by_email(AnonymousEmail).nil?
  end

  def self.down
    user = User.find_by_email(AnonymousEmail)
    user.delete if user
  end
end
