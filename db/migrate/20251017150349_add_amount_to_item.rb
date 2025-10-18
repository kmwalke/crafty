class AddAmountToItem < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :stack_amount, :integer, null: false, default: 1
  end
end
