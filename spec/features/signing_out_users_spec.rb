require "rails_helper"

RSpec.feature "Sign out user" do
  before do
    @user = User.create!(email:"user@example.com", password:"password")

    visit "/"
    click_link "LOG IN"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  scenario do
    visit "/"
    click_link "LOG OUT"
    expect(page).to have_content("Signed out successfully.")
    expect(page).not_to have_content("LOG OUT")
  end
end
