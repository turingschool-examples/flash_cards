require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  deck = Deck.new([card_1, card_2, card_3])

  round = Round.new(deck)

  it 'exists' do
    expect(round).to be_instance_of(Round)
  end

  it 'has deck' do
    round.deck

    expect(deck).to be_instance_of(Deck)
  end

  xit 'has turns' do
    round.turns

    expect(turns).to be_instance_of(Turn)
  end

  xit 'shows current card' do
    round.current_card
  end

  xit 'takes turn' do
    new_turn = round.take_turn
  end
end
