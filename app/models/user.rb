class User < ApplicationRecord
  #devise modules
  devise :database_authenticatable, :registerable, :omniauthable,
  :omniauth_providers => [:instagram]
  #################################################################################################

  #associations
  has_one :provider, inverse_of: :user, dependent: :destroy
  #################################################################################################

  #nested_attributes
  accepts_nested_attributes_for :provider
  #################################################################################################

  #validations
  validates :user_name,  :full_name, :password, presence: true
  validates :user_name, uniqueness: {message: I18n.t("app.already_exist")}
  validates :password, length: { minimum: 3,
    message: I18n.t("model.user.valid_password")}
  #################################################################################################

  #class methods
  def self.create_or_update_insta_user(auth)
    user   = User.find_by(user_name: auth[:info][:nickname]) || User.new

    #checking whether user is created via normal process or by social provider
    if (user.persisted? && user.try(:provider).nil?) 
      user.errors.add(:user_name, I18n.t('app.already_exist'))
    else
      user.build_provider if user.new_record?
      user.social_provider_user(auth)
      user.save
    end

    user #returning user
  end

  #################################################################################################

  #instance methods
  def social_provider_user(auth)
    self.attributes = {
      full_name:                auth[:info][:name],
      user_name:                auth[:info][:nickname],
      password:                 Devise.friendly_token[0,20],
      image_url:                auth[:info][:image],
      provider_attributes: {
        provider_name:          auth[:provider],
        uid:                    auth[:uid],
        token:                  auth[:credentials][:token],
        expires:                auth[:credentials][:expires],
      }
    }
  end
end
