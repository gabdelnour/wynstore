class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :quantity
      t.text :item_description
      t.float :price
      t.string :category
      t.string :design
      t.string :item_ref

      t.timestamps
    end
  end
end
