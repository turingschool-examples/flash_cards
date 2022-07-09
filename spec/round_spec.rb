require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'

RSpec.describe Round do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)

  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'has a deck' do
    expect(@round.deck).to be_instance_of(Deck)
    expect(@round.deck).to eq(@deck)
  end

  it 'stores an array of turn instances' do
    expect(@round.turns).to eq([])
  end

  it 'has a current card for a turn' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'can take a new turn' do
    new_turn = @round.take_turn("Juneau")

    expect(new_turn).to be_instance_of(Turn)
    expect(new_turn.card).to eq(@card_1)
    expect(new_turn.correct?).to eq(true)
    expect(@round.turns).to eq([new_turn])
    expect(@round.number_correct).to eq(1)
    expect(@round.current_card).to eq(@card_2)
  end

  it 'can take a second turn' do
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.turns.count).to eq(2)
    expect(@round.turns.last.feedback).to eq("Incorrect.")
    expect(@round.number_correct).to eq(1)
    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:STEM)).to eq(0)
    expect(@round.percent_correct).to eq(50.0)
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(@round.current_card).to eq(@card_3)
  end
end
