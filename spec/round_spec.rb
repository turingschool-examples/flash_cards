require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before(:each) do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    @deck = Deck.new(cards)
    @round = Round.new(@deck)
  end
  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end
  it 'has a deck' do
    expect(@round.deck).to be_instance_of(Deck)
    expect(@round.deck).to eq(@deck)
  end
  it 'starts with no turns' do
    expect(@round.turns).to be_instance_of(Array)
    expect(@round.turns).to be_empty
  end
  it 'takes current turn' do
    expect(@round.current_card). to eq(@deck.cards[0])
  end
  it 'takes new turn' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn).to be_instance_of(Turn)
    expect(@round.turns.first).to eq(new_turn)
    # expect(@round.take_turn("Juneau")).to eq(@new_turn)
  end
  it 'saves turns' do
    @round.take_turn("Juneau")
    expect(@round.turns).to_not be_empty
  end
  it 'all is a correct quess' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct).to eq(1)
    # expect (@round.number_correct to eq
  end
  it 'detects current card' do
    expect(@round.current_card).to eq(@round.deck.cards[0])
  end
  it 'detects new turn class' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.class).to eq(Turn)
  end
  it 'checks if new_turn is correct' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.correct?).to eq(true)
  end
  it 'detects correct in round' do
    new_turn = @round.take_turn("Juneau")
    # require 'pry'; binding.pry
    expect(@round.number_correct).to eq(1)
  end
end
