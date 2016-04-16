require 'rails_helper'

RSpec.describe Speaker, type: :model do
  describe 'associations' do
    it { should have_many(:talks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  describe "#gravatar" do
    it "return the gravatar url" do
      speaker = Speaker.new(email: 'contato@thiagobelem.net')
      expect(speaker.gravatar).to eq("http://gravatar.com/avatar/67a6eb9b43b617b2051b912b8373a156")
    end
  end
end
