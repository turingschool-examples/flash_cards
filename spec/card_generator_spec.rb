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

<<<<<<< HEAD
=======
      # require 'pry'; binding.pry

>>>>>>> 4d4a8f37e9fa09820df446f46ab8624bfc8797f1
      expect(card_array[0]).to be_a(Card)
    end
  end

end
