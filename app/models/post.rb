class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :user
  mount_uploader :img, ImageUploader
  paginates_per 5
  
  def self.previous(c_id)
    where("id < #{c_id}").last
  end
  
  def self.next(c_id)
    where("id > #{c_id}").first
  end
end
