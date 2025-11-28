class CreateQuests < ActiveRecord::Migration[8.0]
  def change
    create_table :quests do |t|
      t.string :name, null: false
      t.integer :dungeon_id
      t.integer :level, null: false
      t.integer :reward_credits, null: false

      t.timestamps
    end
  end
end
