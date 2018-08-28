require 'rails_helper'

require './spec/helpers/registration_helper.rb'

RSpec.configure do |c|
  c.include RegistrationHelper
end

RSpec.feature "user registration" do
  context "using instagram" do
    verify_omniauth
    visit root_path
    expect(page).to have_css('img.insta-logo')
    find('img.insta-logo').click
    # expect(page).to have_link("Log Out")
    # expect(page).to have_link("mouse123")
  end

  context "normal process" do
    visit root_path
    fill_in "user_user_name", :with => 'John'
    fill_in "user_full_name", :with => 'John Joye'
    fill_in "user_password", :with => '12345678901'
    click_button "Get Started"
    expect(page).to have_text(I18n.t("devise.registrations.signed_up"))
    expect(page).to have_link("Log Out")
    expect(page).to have_link("John")
  end

end
