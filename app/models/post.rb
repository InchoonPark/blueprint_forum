class Post < ApplicationRecord
  has_attached_file :photo
  do_not_validate_attachment_file_type :photo

  belongs_to :user
  has_many :comments, dependent: :destroy
end
