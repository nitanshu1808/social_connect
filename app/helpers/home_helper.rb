module HomeHelper
  # This helper module provides helper methods for the home view templates

  def login_logout_path
    current_user && logout_path || user_path
  end

  def logout_path
    link_to destroy_user_session_path, method: :delete, class: "btn my-2 my-sm-0 login-btn" do
      I18n.t("app.logout")
    end
  end

  def user_path
    (params["controller"] == "home" && params["action"] == "index") ? login_path : registration_path
  end

  def welcome_user_msg
    if current_user
      link_to root_path, class: "nav-link app-name" do
        current_user.user_name
      end
    end
  end

  def display_user_img
    if current_user
      link_to root_path, class: "navbar-brand" do
        if profile_picture_url
          image_tag(profile_picture_url, alt: "logo", class: 'app-icon rounded-circle')
        else
          image_tag("default_user.png", alt: "logo", class: 'app-icon rounded-circle')
        end
      end
    end
  end

  def instagram_button
    link_to user_instagram_omniauth_authorize_path do
      image_tag("instagram_button.png", class: "insta-logo")
    end
  end

  def login_path
    link_to new_user_session_path, class: "btn my-2 my-sm-0 login-btn" do
      I18n.t("app.login")
    end
  end

  def registration_path
    link_to root_path, class: "btn my-2 my-sm-0 login-btn" do
      I18n.t("app.sign_up")
    end
  end

  def check_more_feeds
    if @user_media["pagination"].present?
      link_to load_more_path(max_id: @user_media["data"].last["id"]), class: "load_more-btn btn", remote: true do
        I18n.t("app.load_more")
      end
    end
  end

  def profile_picture_url
    current_user.image_url
  end
end
