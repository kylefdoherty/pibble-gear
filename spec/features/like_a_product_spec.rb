require "rails_helper"

feature "Liking Products" do
  scenario "Like a specific product" do
    product = create(:product, id: 1)

    visit "/products/1"

    click_link("like-heart")

    expect(page).to have_content("1 like")
  end
end
