class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :profile_picture, ImageUploader
  has_one :profile, dependent: :destroy
  attr_accessor :auth_token

  
  def get_default_data
    return {
      first_name: self.first_name,
      last_name: self.first_name,
      profile_picture: self.profile_picture,
      email: self.email,
      id: self.id,
      profile: self.profile
    }
  end
end
