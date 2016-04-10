require 'rails_helper'

RSpec.describe Talk, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }

    it 'start is before finish' do
      talk = Talk.new(title: 'Title', description: 'Qualquer', start: '10:00:00', finish: '10:12:00')

      talk.start = '10:00:00'
      talk.finish = '09:00:00'
      expect(talk).to be_invalid

      talk.start = '11:00:00'
      talk.finish = '11:00:00'
      expect(talk).to be_invalid

      talk.start = '11:00:00'
      talk.finish = '12:00:00'
      expect(talk).to be_valid
    end
  end
end
