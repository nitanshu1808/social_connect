class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def instagram
    @user = User.create_or_update_insta_user(authentication_response)
    if @user.errors.any?
      render 'home/index'
    else
      set_flash_message(:notice, :success, :kind => "Instagram") if is_navigational_format?
      sign_in_and_redirect
    end
  end

  private

  def authentication_response
    Rails.env.test? ? OmniAuth.config.mock_auth[:instagram] : request.env["omniauth.auth"]
  end
end
