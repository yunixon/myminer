class Role < ActiveRecord::Base
  has_many :users
  
  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 40 }
end
