require 'carrierwave/orm/activerecord'

class Configuration < ActiveRecord::Base
  belongs_to :algo_type
  belongs_to :hw_type
  belongs_to :hash_speed
  
  mount_uploader :miner_pic, MinerPicUploader
  mount_uploader :gpuz_pic, MinerPicUploader
  
  validates :nick, :hw_type_id, :hw_name, :mb, :hashrate, :hash_speed_id, presence: true
  validates :driver, :miner, :config, :mb, :algo_type_id, :miner_pic, presence: true
  validates :nick, :hw_name, :mb, :driver, :miner, length: { minimum: 3, maximum: 40 }
  validates :config, length: { minimum: 10, maximum: 400 }
  validates :hashrate, numericality: { greater_than: 0.0 }
  validates_associated :algo_type, :hw_type, :hash_speed
  
  protected
  
  def set_public
    self.update(publicated: true)
  end
  
  def unset_public
    self.update(publicated: false)
  end
  
end
