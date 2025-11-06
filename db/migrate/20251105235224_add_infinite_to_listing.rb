class AddInfiniteToListing < ActiveRecord::Migration[8.0]
  def change
    add_column :listings, :infinite, :boolean, null: false, default: false
  end
end
