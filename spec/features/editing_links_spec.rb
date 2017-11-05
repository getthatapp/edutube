require "rails_helper"

RSpec.feature "Editing a link" do
  before do
    @user = User.create!(email:"user@example.com", password:"password")
    login_as(@user)
    @link1 = @user.links.create(title: "Foobar1", link: "example.com", tag_list: "foo1")
  end

  scenario "User editing a link" do
    visit "/"
    click_link "Edit"
    fill_in "Title", with: "Foobar2" 
    fill_in "Link", with: "www.exampler.com" 
    fill_in "Tag list", with: "foo2"    
    click_button "Update Link"

    expect(page).to have_content("Link updated!")
    expect(page.current_path).to eq(links_path)
  end

  scenario "User fails to edit a link" do
    visit "/"
    click_link "Edit"
    fill_in "Title", with: "Foobar3" 
    fill_in "Link", with: "" 
    fill_in "Tag list", with: "foo2"    
    click_button "Update Link"

    expect(page).to have_content("Link has not been updated!")
    expect(current_path).to eq(link_path(@link1))
  end
end