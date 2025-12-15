class CreateChats < ActiveRecord::Migration[8.1]
  def change
    create_table :chats do |t|
      t.string :content
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
