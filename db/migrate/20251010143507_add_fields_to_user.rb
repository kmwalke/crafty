class AddFieldsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :energy, :integer, null: false, default: User::DEFAULT_ENERGY
    add_column :users, :status, :string, null: false, default: UserStatus::STATUSES[:resting]
    add_foreign_key :users, :user_statuses, column: :status, primary_key: :name
  end
end
