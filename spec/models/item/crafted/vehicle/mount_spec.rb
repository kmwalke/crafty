require 'rails_helper'

RSpec.describe Item::Crafted::Vehicle::Mount do
  let(:user) { create(:user) }

  describe 'crafts' do
    let(:companion) { create(:gatherable_companion, stack_amount: 1, parent_inventory: user.inventory) }

    before do
      crafting_tool = create(:crafting_tool, parent_inventory: user.inventory)
      user.equip_item(crafting_tool)
      @new_item     = crafting_tool.craft(
        described_class,
        [
          companion,
          create(:crafted_harness, stack_amount: 1, parent_inventory: user.inventory),
          create(:gatherable_fish, stack_amount: 10, parent_inventory: user.inventory)
        ]
      )
    end

    it 'crafts the item' do
      expect(@new_item.id).not_to be_nil
    end

    it 'names the item' do
      expect(@new_item.name).to eq(companion.name)
    end
  end

  describe 'feeding' do
    let!(:mount) { create(:vehicle_mount, equipped_by: user) }

    it 'action' do
      expect(mount.actions).to eq %w[feed travel]
    end

    it 'only eats fish' do
      expect { mount.feed(create(:gatherable_fruit, parent_inventory: user.inventory)) }.to raise_error CraftyError
    end

    describe 'gives a bonus' do
      before do
        mount.feed(create(:gatherable_fish, parent_inventory: user.inventory, level: Level::LEGENDARY))
      end

      it 'boosts' do
        expect(mount.boost).to eq(5)
      end

      it 'uses the bonus' do
        energy = mount.energy_usage(create(:location), create(:location))

        expect(energy).to eq(0)
      end

      it 'consumes the bonus' do
        mount.travel(create(:location))

        expect(mount.boost).to eq(4)
      end
    end
  end
end
