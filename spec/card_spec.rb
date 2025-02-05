require 'rspec'
require './lib/card'


describe Card do
  describe '#initalize' do 
    it 'exists' do
      card = Card.new()

      expect(card).to be_instance_of(Card)
    end

require “pry”; binding.pry

    it 'has a question' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card.question).to eq("What is the capital of Alaska?")
    end

    it 'has an answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card.answer).to eq("Juneau")
    end

    it 'has a category' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card.category).to eq(:Geography)
    end

  end
end
