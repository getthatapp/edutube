require "rails_helper"

RSpec.feature "Adding links" do
  before do
    @user = User.create!(email:"user@example.com", password:"password")
    login_as(@user)
  end

  scenario "A user creating a new link" do
    visit "/"
    click_link "Add new link"
    fill_in "Title", with: "Foo"
    fill_in "Link", with: "Bar"
    fill_in "Tag list", with: "FooBar"
    click_button "Create Link"

    expect(Link.last.user).to eq(@user)
    expect(page).to have_content("Link created!")
    expect(page.current_path).to eq(links_path)
    expect(page).to have_content("Created by: #{@user.email}")
  end

  scenario "A user fails to create a new link" do
    visit "/"
    click_link "Add new link"
    fill_in "Title", with: ""
    fill_in "Link", with: ""
    fill_in "Tag list", with: ""
    click_button "Create Link"
    
    expect(page).to have_content("Link has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Link can't be blank")
    expect(page).to have_content("Tag list can't be blank")
  end
end
