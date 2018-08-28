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

end
