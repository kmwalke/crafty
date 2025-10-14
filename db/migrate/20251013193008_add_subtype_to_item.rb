class AddSubtypeToItem < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :subtype, :string
  end
end
