require "rails_helper"

feature "Editing Products" do
  scenario "updating a product" do
    create(:product)

    visit "/products/1"

    click_link "Edit Product"
    fill_in "Name", with: "Extreme Kong"
    click_button "Update Product"

    expect(page).to have_content("Extreme")
  end
end
