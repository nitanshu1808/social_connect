require 'rails_helper'


RSpec.feature "user log in" do

  it "normal process" do
    visit "/users/sign_in"
    fill_in "user_user_name", :with => 'John'
    fill_in "user_password", :with => '12345678901'
    click_button "Log In"
    expect(page).to have_text(I18n.t("app.invalid_credentials"))
  end

  let(:user) { build(:user) }
  let(:user) { create(:user) }

  def fill_in_sign_fields
  	fill_in "user_user_name", :with => 	user.user_name
    fill_in "user_password", 	:with => 	user.password
    find('.form-submit').click
  end

  scenario "Visiting the Site to sign In" do
  	visit root_path
  	find('.login-btn').click
  	fill_in_sign_fields
  	expect(page).to have_content(I18n.t("devise.sessions.signed_in"))
  end

end
