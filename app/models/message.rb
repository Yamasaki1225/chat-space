class Message < ApplicationRecord
  belongs_to :user
  lerongs_to :group
  mount_uploader :image, ImageUploader
  validates_presence_of :body, unless: image
  validates_presence_of :image, unless: :body?
end
