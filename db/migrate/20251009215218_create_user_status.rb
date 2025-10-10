class CreateUserStatus < ActiveRecord::Migration[8.0]
  def change
    create_table :user_statuses, id: false do |t|
      t.string :name, primary_key: true
    end

    UserStatus.populates_statuses
  end
end
