require 'rails_helper'

RSpec.describe UserStatus do
  it 'populates statuses' do
    described_class.delete_all

    described_class.populates_statuses

    UserStatus::STATUSES.each do |status|
      expect(described_class.find_by(name: status)).to be_a(described_class)
    end
  end
end
