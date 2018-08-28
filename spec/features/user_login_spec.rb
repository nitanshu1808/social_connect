require 'rails_helper'


RSpec.feature "user log in" do

  it "normal process" do
    visit "/users/sign_in"
    fill_in "user_user_name", :with => 'John'
    fill_in "user_password", :with => '12345678901'
    click_button "Log In"
    expect(page).to have_text(I18n.t("app.invalid_credentials"))
  end

end
