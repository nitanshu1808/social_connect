module HomeHelper

  def login_logout_path
    current_user && logout_path || login_path
  end

  def logout_path
    link_to destroy_user_session_path, method: :delete, class: "btn my-2 my-sm-0 login-btn" do
      I18n.t("app.logout")
    end
  end

  def login_path
    link_to root_path, class: "btn my-2 my-sm-0 login-btn" do
      I18n.t("app.login")
    end
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
        if current_user.image_url
          image_tag(current_user.image_url, alt: "logo", class: 'app-icon')
        else
          image_tag("default_user.png", alt: "logo", class: 'app-icon')
        end
      end
    end
  end
end
