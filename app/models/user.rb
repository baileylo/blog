class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_length_of :username, :in => 3..15

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable, :token_authenticatable

  has_many :posts

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login

  protected
    def self.find_for_database_authentication(conditions)
      puts "-------------------------------------------"
      puts "find_for_database_authentication was called"
      login = conditions.delete(:login)
      where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
    end
end
