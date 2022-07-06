require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'can recognise round as instance of class' do
    expect(@round).to be_instance_of(Round)
  end

  it 'can utilize turns' do
    round.deck
    expect(round.turns).to eq([])
    round.current_card

    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to be_instance_of(Turn)
    expect(new_turn.correct?).to eq(true)
    round.turns

  end

  
end
