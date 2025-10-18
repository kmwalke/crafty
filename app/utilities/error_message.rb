class ErrorMessage
  GENERIC = {
    interface_method: 'Implement in child class'
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
