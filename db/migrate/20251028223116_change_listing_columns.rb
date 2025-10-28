class ChangeListingColumns < ActiveRecord::Migration[8.0]
  def change
    remove_column :listings, :price_type, :string
    remove_column :listings, :price_amount, :integer
    remove_column :listings, :price_level, :integer

    add_column :listings, :price, :integer, null: false, default: 1
  end
end
