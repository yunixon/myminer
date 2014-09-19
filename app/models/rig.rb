class Rig < ActiveRecord::Base
  acts_as_commentable

  mount_uploader :photo, MinerPicUploader

  validates :name, :photo, presence: true
  validates :name, length: { minimum: 3, maximum: 40 }

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  def change_public_status
    self.update(published: (self.published == false) ? true : false)
  end

end
