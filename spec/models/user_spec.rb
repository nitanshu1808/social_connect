require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates user from an oauth hash" do
    auth = {
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
    }

    User.create_or_update_insta_user(auth)
    new_user = User.first
    debugger
    expect(new_user.user_name).to eq("mouse123")
    expect(new_user.full_name).to eq("mickeymouse")
    expect(new_user.image_url).to eq("https://scontent.cdninstagram.com/vp/c5386c0412db18t51.2885-19/s150x150/32897793_1800396913356398_6416828715300290560_n.jpg")
    expect(new_user.provider.provider_name).to    eq("instagram")
    expect(new_user.provider.uid).to     eq("13459000408")
    expect(new_user.provider.token).to   eq("135asd9000408.0059313.126055d95e894c9ab152")
    expect(new_user.provider.expires).to eq(false)
  end
end
