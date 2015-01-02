class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :affiliate_link
      t.string :large_image_link
      t.string :small_image_link


      t.timestamps
    end
  end
end
