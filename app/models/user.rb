class User < ActiveRecord::Base
  attr_accessor :nick
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :authentication_keys => [:nick]
  
  validates :nick, :uniqueness => { :case_sensitive => false }
  
  def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:nick)
    where(conditions).where(["lower(nick) = :value", { :value => nick.downcase }]).first
  else
    where(conditions).first
  end
end
  
end
