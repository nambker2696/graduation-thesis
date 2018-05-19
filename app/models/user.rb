class User < ApplicationRecord
  devise  :database_authenticatable,
  :registerable,
  :recoverable,
  :rememberable,
  :trackable,
  :omniauthable, omniauth_providers: [:google_oauth2]
  mount_uploader :avatar, AvatarUploader

  has_many :bookings
  has_many :orders
  has_many :locations
  has_many :reviews, dependent: :destroy
  has_many :identities


  def is_owner_of? review
    self.id == review.user_id
  end

  def bookmark_of_this review
    review.bookmarks.find_by user_id: self.id
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

  def google_oauth2
    identities.where( :provider => "google_oauth2" ).first
  end

  def google_oauth2_client
    if !@google_oauth2_client
      @google_oauth2_client = Google::APIClient.new(:application_name => 'HappySeed App', :application_version => "1.0.0" )
      @google_oauth2_client.authorization.update_token!({:access_token => google_oauth2.accesstoken, :refresh_token => google_oauth2.refreshtoken})
    end
    @google_oauth2_client
  end
end
