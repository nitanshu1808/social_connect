class HomeController < ApplicationController

  before_action :check_user_provider, only: :feeds

  def index
  end

  #displaying user information and picture feeds
  def feeds
    @provider   = current_user.provider
    @user_info  = InstaApi.new(api_params).profile_information
    @user_media = InstaApi.new(api_params).recent_media
  end

  private

  def check_user_provider
    (render "normal_user_welcome") if current_user.provider.nil?
  end

  def api_params
    {access_token: @provider.token}
  end
end
