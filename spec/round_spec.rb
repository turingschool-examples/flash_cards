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

  it 'exists & has attributes' do
    expect(@round).to be_a(Round)
    expect(@round.deck).to eq(@deck)
    expect(@round.turns).to eq([])
  end

  it 'can tell us the current card' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'can take a new turn' do
    @new_turn = Turn.new("Juneau", @card_1)

    expect(@new_turn).to be_a(Turn)
    expect(@new_turn.correct?).to be(true)
  end

  it 'can tally correct answers' do
    @new_turn = Turn.new("Juneau", @card_1)
    @round.take_turn("Juneau")

    expect(@round.number_correct).to eq(1)
  end

  it 'can give us the total turn count' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.turns.count).to eq(2)
    expect(@round.turns.last.feedback).to eq('Incorrect.')
    expect(@round.number_correct).to eq(1)
  end

  it 'tells us the #number_correct_by_category' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:STEM)).to eq(0)
  end

end
