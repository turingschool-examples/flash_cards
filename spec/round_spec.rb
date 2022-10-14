require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe do

  describe '#class foundation' do

  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)


    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

  end

end

  describe '#deck method' do
    it 'returns the deck the Round class is usuing'do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)


      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.deck).to eq(deck)

    end
  end

  describe '#turns method' do
    it 'will tell you show you the turns you have completed' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)


      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.turns).to eq([])

    end


  end

  describe '#current_card' do
    it 'will tell you the current card you are on' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)


    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)

  end

  end


end
