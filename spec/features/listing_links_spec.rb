require "rails_helper"

RSpec.feature "Listing links" do
  before do
    @user = User.create!(email:"user@example.com", password:"password")
    login_as(@user)
    @link1 = @user.links.create(title: "Foobar1", link: "example.com", tag_list: "foo1")
    @link2 = @user.links.create(title: "Foobar2", link: "example.com", tag_list: "foo2")
  end

  scenario "User lists all links" do
    visit "/"

    expect(page).to have_link(@link1.title)
    expect(page).to have_link(@link1.tag_list)
    expect(page).to have_content("Created by: #{@user.email}")
    expect(page).to have_link(@link2.title)
    expect(page).to have_link(@link2.tag_list)
    expect(page).to have_content("Created by: #{@user.email}")
  end
end