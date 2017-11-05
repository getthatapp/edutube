require "rails_helper"

RSpec.feature "Adding links" do
  before do
    @user = User.create!(email:"user@example.com", password:"password")
    login_as(@user)
  end

  scenario "A user creating new link" do
    visit "/"
    click_link "Add new link"
    fill_in "Title", with: "Foo"
    fill_in "Link", with: "Bar"
    fill_in "Tags", with: "tag"
    click_button "Create link"

    expect(page).to have_content("Link created!")
    expect(page.current_path).to eq(links_path)
  end
end
