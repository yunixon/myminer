require 'carrierwave/orm/activerecord'

class Configuration < ActiveRecord::Base
  belongs_to :algo_type
  belongs_to :hw_type
  
  mount_uploader :miner_pic, MinerPicUploader
  mount_uploader :gpuz_pic, MinerPicUploader
  
  protected
  
  def set_public
    self.update(publicated: true)
  end
  
  def unset_public
    self.update(publicated: false)
  end
  
end
