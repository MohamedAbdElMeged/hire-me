class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :cv, CvUploader
end
