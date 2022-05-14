require './lib/card'

RSpec.describe Card do
  describe '#initialize' do
    it 'creates an instance of Card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card).to be_instance_of(Card)
    end
  end

  describe '@question' do
    it 'returns a question' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card.question).to eq("What is the capital of Alaska?")
    end
  end

  describe '@answer' do
    it 'returns an answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card.answer).to eq("Juneau")
    end
  end

  describe '@category' do
    it 'has a category' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card.category).to eq(:Geography)
    end
  end
end
