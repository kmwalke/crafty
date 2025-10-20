class AddStatsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :vitality, :integer, null: false, default: User::MAX_VITALITY
    add_column :users, :age, :integer, null: false, default: 16
  end
end
