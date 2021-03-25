require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)

    expect(card_generator).to be_a(CardGenerator)
  end

  describe '#cards ' do
    it 'creates an array of card objects' do
      filename = "cards.txt"
      card_generator = CardGenerator.new(filename)
      card_array = card_generator.cards

      # require 'pry'; binding.pry

      expect(card_array[0]).to be_a(Card)
    end
  end

end
