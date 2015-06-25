require "rails_helper"

feature "User Profile" do

  scenario "updating a user profile" do
    user = create(:user)
    create(:profile, user: user)
    login_as(user, :scope => :user)

    visit edit_user_path(user)

    fill_in "Name", with: "Bruce Wayne"
    fill_in "Bio",  with: "I'm fucking Batman...what do you do?"
    click_button "Save"

    expect(page).to have_content("Bruce Wayne")
    expect(page).to have_content("I'm fucking Batman...what do you do?")
  end
end
