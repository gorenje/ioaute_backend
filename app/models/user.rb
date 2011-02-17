class User < ActiveRecord::Base
  ### removed (no longer using email + password for user identifcation)
  ###   :validatable, :confirmable, :registerable,  :recoverable 
  ### and replaced with
  ###    :twitter_oauth
  devise(:database_authenticatable, :token_authenticatable, :rememberable, 
         :trackable, :lockable, :twitter_oauth, :facebook_connectable)

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :publications

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    # Get the user email info from Facebook for sign up
    # You'll have to figure this part out from the json you get back
    data = ActiveSupport::JSON.decode(access_token)

    if user = User.find_by_email(data["email"])
      user
    else
      # Create an user with a stub password.
      User.create!(:name => data["name"], :email => data["email"], 
                   :password => Devise.friendly_token)
    end
  end
  
  ## TODO specific crappy code.
  def is_admin?
    (Rails.env == "development" && id == 1) || 
      (Rails.env == "production" && [1,2].include?(id)) || false
  end
  
  def name
    facebook_uid || twitter_handle || email
  end
  
  def link_to_home
    if twitter_handle
      "http://twitter.com/#!/#{twitter_handle}"
    else 
      if facebook_uid
        "http://facebook.com/profile.php?id=#{facebook_uid}"
      else
        "/"
      end
    end
  end
end
