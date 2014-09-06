class AlgoType < ActiveRecord::Base
  has_many :configurations, dependent: :destroy
  
end