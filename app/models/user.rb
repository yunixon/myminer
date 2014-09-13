class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable#, :authentication_keys => [:nick]
  
  belongs_to :role
  
  before_create :set_default_role
  
  validates :nick, presence: true
  validates :nick, uniqueness: { case_sensitive: false }
  validates :nick, length: { minimum: 3, maximum: 40 }
  validates_associated :role
  
  #def self.find_first_by_auth_conditions(warden_conditions)
  #  conditions = warden_conditions.dup
  #  if login = conditions.delete(:nick)
  #    where(conditions).where(["lower(nick) = :value", { :value => nick.downcase }]).first
  #  else
  #    where(conditions).first
  #  end
  #end
  
  private
  
  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end
  
  
  
end
