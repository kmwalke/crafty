require 'rails_helper'

RSpec.describe Skills do
  it 'requires a user' do
    expect { create(:skills, user: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  describe 'requires valid crafting' do
    it 'requires positive' do
      expect { create(:skills, crafting: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'requires less than max' do
      expect { create(:skills, crafting: (Skills::MAX_LEVEL + 1)) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'requires valid fighting' do
    it 'requires positive' do
      expect { create(:skills, fighting: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'requires less than max' do
      expect { create(:skills, fighting: (Skills::MAX_LEVEL + 1)) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'requires valid gathering' do
    it 'requires positive' do
      expect { create(:skills, gathering: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'requires less than max' do
      expect { create(:skills, gathering: (Skills::MAX_LEVEL + 1)) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'requires valid trading' do
    it 'requires positive' do
      expect { create(:skills, trading: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'requires less than max' do
      expect { create(:skills, trading: (Skills::MAX_LEVEL + 1)) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'requires valid traveling' do
    it 'requires positive' do
      expect { create(:skills, traveling: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'requires less than max' do
      expect { create(:skills, traveling: (Skills::MAX_LEVEL + 1)) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
