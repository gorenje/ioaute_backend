class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
  end

  def contact_us
  end
  
  def imprint
  end
  
  def privacy_policy
  end
end
