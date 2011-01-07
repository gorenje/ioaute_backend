class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :publications
end
