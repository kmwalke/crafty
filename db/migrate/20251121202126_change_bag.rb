class ChangeBag < ActiveRecord::Migration[8.0]
  def up
    rename_column :users, :bag_id, :pet_id
    rename_column :users, :bag_type, :pet_type

    ItemType.populate
    Item.where(type: 'Item::Crafted::Bag').update_all(type: ItemType::CRAFTED[:pet])
  end
end
