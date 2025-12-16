class ChangeBag < ActiveRecord::Migration[8.0]
  def up
    rename_column :users, :bag_id, :pet_id
    rename_column :users, :bag_type, :pet_type

    ItemType.populate
    Item.where(type: 'Item::Crafted::Bag').update_all(type: ItemType::CRAFTED[:pet])
  end

  def down
    rename_column :users, :pet_id, :bag_id
    rename_column :users, :pet_type, :bag_type
  end
end
