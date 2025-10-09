require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'requires a name' do
    expect(described_class.create(name: '').errors).to have_key(:name)
  end

  it 'requires a pos_x' do
    expect(described_class.create(pos_x: '').errors).to have_key(:pos_x)
  end

  it 'requires a pos_y' do
    expect(described_class.create(pos_y: '').errors).to have_key(:pos_y)
  end

  it 'requires a description' do
    expect(described_class.create(description: '').errors).to have_key(:description)
  end

  it 'requires name uniqueness' do
    location = create(:location)
    expect { create(:location, name: location.name) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
