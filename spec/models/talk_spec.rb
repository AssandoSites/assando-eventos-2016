require 'rails_helper'

RSpec.describe Talk, type: :model do
  describe 'associations' do
    it { should belong_to(:speaker) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }
    it { should validate_presence_of(:speaker) }

    it 'start is before finish' do
      talk = build(:talk, start: '10:00:00', finish: '09:00:00')
      expect(talk).to be_invalid

      talk = build(:talk, start: '11:00:00', finish: '11:00:00')
      expect(talk).to be_invalid

      talk = build(:talk, start: '11:00:00', finish: '12:00:00')
      expect(talk).to be_valid
    end
  end
end
