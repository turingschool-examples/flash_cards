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

  it 'is an instance of Round class' do
    expect(@round).to be_instance_of(Round)
  end

  it 'has attributes' do
    expect(@round.deck).to eq(@deck)
    expect(@round.turns).to eq([])
  end

  it '#current_card' do
    expect(@round.current_card).to eq(@card_1)
  end

  it '#take_turn' do
    # @round.take_turn('Juneau')
    new_turn = @round.take_turn('Juneau')

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true)
    expect(@round.turns).to eq([new_turn])

    new_turn_2 = @round.take_turn('Mars')
    expect(@round.turns.last).to eq(new_turn_2)
  end

  it '#number_correct' do
    @round.take_turn('Juneau')
    expect(@round.number_correct).to eq(1)

    @round.take_turn('Venus')
    expect(@round.turns.count).to eq(2)
    expect(@round.turns.last.feedback).to eq('Incorrect.')
    expect(@round.number_correct).to eq(1)

    @round.take_turn('North north west')
    expect(@round.turns.count).to eq(3)
    expect(@round.turns.last.feedback).to eq('Correct!')
    expect(@round.number_correct).to eq(2)
  end

  it '#number_correct_by_category' do
    @round.take_turn('Juneau')
    expect(@round.number_correct_by_category(:Geography)).to eq(1)

    @round.take_turn('Venus')
    expect(@round.number_correct_by_category(:STEM)).to eq(0)

    @round.take_turn('North north west')
    expect(@round.number_correct_by_category(:STEM)).to eq(1)
  end

  it '#percent_correct' do
    @round.take_turn('Juneau')
    @round.take_turn('Venus')

    expect(@round.percent_correct).to eq(50.0)
  end

  it '#percent_correct_by_category' do
    @round.take_turn('Juneau')
    @round.take_turn('Venus')
    @round.take_turn('North north west')

    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(@round.percent_correct_by_category(:STEM)).to eq(50.0)
  end

  it '#current_card' do
    @round.take_turn('Juneau')
    @round.take_turn('Venus')

    expect(@round.current_card).to eq(@card_3)
  end
end
