class ApplicationController < ActionController::Base

	def sign_in_and_redirect
		sign_in(resource_name, resource)
    redirect_to root_url
	end

	protected

  def after_sign_in_path_for(resource)
    root_url
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_url
  end
end
