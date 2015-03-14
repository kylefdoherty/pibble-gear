require "rails_helper"

feature "Creating Comments" do

  scenario "add a comment to a product" do
    product = create(:product, id: 1)

    visit "/products/1"

    fill_in "Leave Comment:", with: "Amazing product"
    click_button "Comment"

    expect(page).to have_content("Amazing product")
  end
end
