class ErrorMessage
  CRAFTING  = {
    failed: 'Crafting failed!',
    wrong_ingredients: 'You don\'t have enough ingredients'
  }.freeze
  GENERIC   = {
    clever: 'Clever girl...',
    interface_method: 'Implement in child class',
    invalid_level: 'Invalid level number'
  }.freeze
  MOUNT     = {
    not_favorite: 'Your mount only eats fish.'
  }.freeze
  INVENTORY = {
    already_in_inventory: 'Already in an inventory.',
    no_space: 'Your inventory is full.',
    typed_inventory: 'The item does not match this inventory\'s type.'
  }.freeze

  ITEM = {
    must_equip_item: 'You have to equip an item to use it.'
  }.freeze

  USER = {
    build_additional_pylons: 'You don\'t have enough energy.'
  }.freeze
end
