class CreateChecks < ActiveRecord::Migration[8.1]
  def change
    create_table :checks do |t|
      t.string :skill
      t.integer :amount
      t.integer :room_id

      t.timestamps
    end
  end
end
