require 'rails_helper'

require './spec/helpers/registration_helper.rb'

RSpec.configure do |c|
  c.include RegistrationHelper
end

RSpec.feature "user registration" do
  scenario "using instagram  and normal process" do
    verify_omniauth
    visit root_path
    expect(page).to have_css('img.insta-logo')
    find('img.insta-logo').click

    expect(page).to have_content("Nitanshu Rehani")
    expect(page).to have_link("Logout")
  end
end
