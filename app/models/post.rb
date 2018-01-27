class Post < ApplicationRecord
  has_attached_file :photo, styles: { thumbnail: "150x150#" }
  validates_attachment_content_type :photo, content_type: /\Aimage/

  belongs_to :user
  has_many :comments, dependent: :destroy
end
