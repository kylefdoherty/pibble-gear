require 'rails_helper'

feature "Creating Products" do

  scenario "can create a product" do
    user = create(:admin_user)
    login_as(user, :scope => :user)

    visit "/products/new"

    fill_in "Name", with: "Black Kong"
    fill_in "Description", with: "Super Tough Toy.  Essential if you have a Pit Bull."
    fill_in "Affiliate", with: "somelink.com"
    click_button "Create Product"

    expect(page).to have_content("Product created")
  end
end
