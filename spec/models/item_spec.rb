require 'rails_helper'

RSpec.describe Item do
  let(:item) { create(:generic_item) }
  let(:vehicle) { create(:crafted_bicycle) }

  it 'shows the level name' do
    expect(item.level_name).to eq(Level.level_name(item.level))
  end

  it 'items are not equippable' do
    expect(item.equippable?).to be false
  end

  it 'shows the full name' do
    expect(item.full_name).to eq("#{item.name} #{item.pretty_type}")
  end

  describe 'access control' do
    let(:owner) { create(:user) }
    let(:visitor) { create(:user) }
    let(:private_item) { create(:generic_item, is_private: true, created_by: owner) }

    it 'is private' do
      expect(private_item.permitted_user?(visitor)).to be false
    end

    it 'is owned' do
      expect(private_item.permitted_user?(owner)).to be true
    end
  end
end
