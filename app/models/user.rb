class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_length_of :username, :in => 3..15

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable, :token_authenticatable

  has_many :posts

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
end
