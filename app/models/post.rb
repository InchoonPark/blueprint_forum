class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :photo
  do_not_validate_attachment_file_type :photo
  validates :user_id, presence: true
  validates :heading, presence: true
  validates :description, presence: false
end
