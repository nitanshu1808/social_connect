module HomeHelper
  # This helper module provides helper methods for the home view templates

  def login_logout_path
    content_tag :li do
      current_user && logout_path || user_path
    end
  end

  def logout_path
    link_to destroy_user_session_path, method: :delete do
      html_login_span.html_safe + I18n.t("app.logout")
    end
  end

  def user_path
    (params["controller"] == "home" && params["action"] == "index") ? login_path : registration_path
  end

  def welcome_user_msg
    link_to I18n.t("app.welcome") + " " + current_user.user_name, root_path  if current_user
  end

  def display_user_img
    if current_user
      content_tag :li do
        link_to root_path do
          fetch_image
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
    link_to new_user_session_path do
      html_login_span.html_safe + I18n.t("app.login")
    end
  end

  def registration_path
    link_to root_path do
      html_registration_span.html_safe + I18n.t("app.sign_up")
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

  def html_login_span
    content_tag( :span,class: "glyphicon glyphicon-log-in") do "" end + " "
  end

  def html_registration_span
    content_tag( :span,class: "glyphicon glyphicon-user") do "" end + " "
  end

  def user_profile_image_tag(image)
    image_tag(image, alt: "logo", class: 'app-icon img-circle')
  end

  def fetch_image
    profile_picture_url ? user_profile_image_tag(profile_picture_url) : user_profile_image_tag("default_user.png")
  end
end
