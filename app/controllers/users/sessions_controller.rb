class Users::SessionsController < Devise::SessionsController

  def create
    @user = User.find_by(user_name: params[:user][:user_name])
    if @user && @user.valid_password?(params[:user][:password])
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      redirect_to root_url
    else
      @user = @user || User.new(signin_params)
      @user.errors.add(:password, I18n.t('app.invalid_credentials'))
      render 'new'
    end
  end

  def signin_params
    params.require(:user).permit(:user_name, :password)
  end

end
