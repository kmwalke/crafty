class CreateSkills < ActiveRecord::Migration[8.1]
  def up
    create_table :skills do |t|
      t.integer :user_id, null: false
      t.integer :crafting, null: false, default: 1
      t.integer :fighting, null: false, default: 1
      t.integer :gathering, null: false, default: 1
      t.integer :trading, null: false, default: 1
      t.integer :traveling, null: false, default: 1
    end

    User.find_each do |user|
      Skills.create(user:)
    end
  end

  def down
    drop_table :skills
  end
end
