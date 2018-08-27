module RegistrationHelper
  def verify_omniauth
    # first, setting OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, providing a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({

    })
  end
end