class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def instagram
    @user = User.create_or_update_insta_user(request.env["omniauth.auth"])
    if @user.errors.any?
      render 'home/index'
    else
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Instagram") if is_navigational_format?
    end
  end
end
