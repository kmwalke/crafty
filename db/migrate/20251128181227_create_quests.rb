class CreateQuests < ActiveRecord::Migration[8.0]
  def change
    create_table :quests do |t|
      t.string :name
      t.integer :dungeon_id
      t.integer :level
      t.integer :reward_credits

      t.timestamps
    end
  end
end
