require 'rails_helper'

RSpec.describe User, type: :model do
  it 'requires a name' do
    expect(described_class.create(name: '').errors).to have_key(:name)
  end

  it 'requires an email' do
    expect(described_class.create(email: '').errors).to have_key(:email)
  end

  it 'requires email uniqueness' do
    user = create(:user)
    expect { create(:user, email: user.email) }.to raise_error(ActiveRecord::RecordInvalid)
  end

end
