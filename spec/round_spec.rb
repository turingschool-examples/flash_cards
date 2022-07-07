require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  # Uses before method to repeat code below for each it method
  before(:each) do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?','North north west', :STEM)
    @deck = Deck.new([card_1, card_2, card_3])
    @round = Round.new(@deck)
    @new_turn = @round.take_turn("Juneau")
  end
  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end
  it 'has deck' do
    expect(@round.deck).to eq(@deck)
  end
  it 'turns to be []' do
    expect(@round.turns).to eq([])
  end
  it 'current card is correct' do
    expect(@round.current_card).to eq(@round.deck.cards[0])
  end
  it 'new turn is correct' do
    expect(@new_turn).to eq(@round.turn)
  end
  it 'turn class is equal to turn' do
    expect(@new_turn.class).to eq(Turn)
  end
end
