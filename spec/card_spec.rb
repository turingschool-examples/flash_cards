require 'rspec'
require './lib/card'

RSpec.describe Card do
  before do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  describe '#card.initialize' do
    it 'is an instance of Card' do
      expect(@card).to be_instance_of(Card)
    end

    it 'has a question when initialized' do
        expect(@card.question).to eq("What is the capital of Alaska?")
    end

    it 'has an answer when initialized' do
      expect(@card.answer).to eq("Juneau")
    end

    it 'has a category when initialized' do
      expect(@card.category).to eq(:Geography)
    end
  end
end
