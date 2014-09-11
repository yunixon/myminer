class HashSpeed < ActiveRecord::Base
  has_many :configurations, dependent: :destroy
  
  validates :speed, presence: true
  validates :speed, length: { minimum: 2, maximum: 6 }
end
