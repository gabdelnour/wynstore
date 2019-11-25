class AddPaidToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :paid, :boolean, null: false, default: false
  end
end
