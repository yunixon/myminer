class Configuration < ActiveRecord::Base
  belongs_to :algo_type
  belongs_to :hw_type
end
