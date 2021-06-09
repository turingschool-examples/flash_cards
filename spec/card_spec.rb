require './lib/card'

RSpec.describe Card do
  describe '#initialize and attr_reader' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    it 'exists' do
      expect(card).to be_instance_of(Card)
    end

    it 'returns a question attribute' do
      expect(card.question).to eq("What is the capital of Alaska?")
    end

    it 'returns an answer attribute' do
      expect(card.answer).to eq("Juneau")
    end

    it 'returns a category attribute' do
      expect(card.category).to eq(:Geography)
    end
  end
end
