class HwType < ActiveRecord::Base
  has_many :configurations, dependent: :destroy
  
end