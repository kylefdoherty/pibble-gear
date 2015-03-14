require "rails_helper"

feature "Creating Comments" do

  scenario "add a comment to a product" do
    product = create(:product, id: 1)

    visit "/products/1"

    click_link "Add Comment"
    fill_in "Your Thoughts:", with: "Amazing product"
    click_button "Comment"

    expect(page).to have_content("Amazing product")
  end
end
