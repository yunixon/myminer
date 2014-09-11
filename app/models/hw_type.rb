class HwType < ActiveRecord::Base
  has_many :configurations, dependent: :destroy
  
  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 40 }
end