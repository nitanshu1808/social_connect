module RegistrationHelper
  def verify_omniauth
    # first, setting OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, providing a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
      provider: "instagram",
      uid: "13459000408",
      info: {
        nickname: "mouse123",
        name:     "mickeymouse",
        image:    "https://scontent.cdninstagram.com/vp/c5386c0412db18t51.2885-19/s150x150/32897793_1800396913356398_6416828715300290560_n.jpg",
        bio:      "Hello World",
        website:  "www.instagram.com",
        is_business: false
      },
      credentials: {
        token: "135asd9000408.0059313.126055d95e894c9ab152",
        expires: false
      }
    })
  end
end
