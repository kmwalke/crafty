class AddReceivesMailsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :receives_emails, :boolean, null: false, default: false
  end
end
