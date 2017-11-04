require "rails_helper"

RSpec.feature "User sign in" do
  before do
    @user = User.create!(email:"user@example.com", password:"password")
  end
  scenario "with valid credentials" do
    visit "/"
    click_link "LOG IN"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).not_to have_link("REGISTER") 
    expect(page).not_to have_link("LOG IN")
  end
end
