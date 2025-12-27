class AddTextToRooms < ActiveRecord::Migration[8.1]
  def up
    add_column :rooms, :intro_text, :text
    add_column :rooms, :fail_text, :text
    add_column :rooms, :success_text, :text

    Room.update_all(intro_text: 'Intro Text')
    Room.update_all(fail_text: 'Fail Text')
    Room.update_all(success_text: 'Success Text')

    change_column :rooms, :intro_text, :text, null: false
    change_column :rooms, :fail_text, :text, null: false
    change_column :rooms, :success_text, :text, null: false
  end

  def down
    drop_column :rooms, :intro_text
    drop_column :rooms, :fail_text
    drop_column :rooms, :success_text
  end
end
