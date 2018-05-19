class User < ApplicationRecord
  devise  :database_authenticatable,
  :registerable,
  :recoverable,
  :rememberable,
  :trackable,
  :validatable,
  :omniauthable,
  :confirmable,
  :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  # mount_uploader :avatar, AvatarUploader

  has_many :bookings
  has_many :orders
  has_many :locations
  has_many :reviews, dependent: :destroy

  def self.from_omniauth_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      # assuming the user model has a name
      user.avatar = auth.info.avatar # assuming the user model has an image

    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
      user = User.create(name: data['name'],
       email: data['email'],
       password: Devise.friendly_token[0,20]
       )
    end
    user
  end  

end
