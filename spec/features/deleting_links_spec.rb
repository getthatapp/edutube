require "rails_helper"

RSpec.feature "Deleting a link" do
  before do
    @user = User.create!(email:"user@example.com", password:"password")
    login_as(@user)
    @link1 = @user.links.create(title: "Foobar1", link: "example.com", tag_list: "foo1")
  end

  scenario "User deleting a link" do
    visit "/"
    click_link "Delete"

    expect(page).to have_content("Link deleted!")
    expect(page.current_path).to eq(links_path)
  end
end