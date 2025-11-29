class CreateUserStatus < ActiveRecord::Migration[8.0]
  def change
    create_table :user_statuses, id: false do |t|
      t.string :name, primary_key: true
    end

    Rails.logger.debug '-- populate UserStatuses'
    UserStatus.populate
  end
end
