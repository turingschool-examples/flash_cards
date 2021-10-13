require "rspec"
require "./lib/round"
require "./lib/deck"
require "./lib/card"
require "./lib/turn"

describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_2)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_an_instance_of(Round)
  end

  it 'attributes' do
    expect(@round.deck).to eq(@deck)
    expect(@round.turns).to eq([])
  end

  it 'current card' do
    expect(@round.current_card).to eq(@card_1)
  end
end

describe 'new turns' do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_2)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
    @new_turn_1 = @round.take_turn("Juneau")
  end

  it 'take turns' do
    expect(@new_turn_1.class).to eq(Turn)
  end

  it 'can determine if turn guess is correct' do
    expect(@new_turn_1.correct?).to eq(true)
  end

  it 'can store turns' do
    expect(@round.turns).to eq([@new_turn_1])
  end

  it 'can return the turns stored' do
    expect(@round.turns).to eq([@new_turn_1])
  end

  it 'can return correct number of turns' do
    expect(@round.number_correct).to eq(1)
  end

  it 'can return the current card' do
    expect(@round.current_card).to eq(@card_2)
  end

  it 'can count the number of rounds' do
    new_turn_2 = @round.take_turn("venus")

    expect(@round.turns.count).to eq(2)
  end

  it 'can return feedback of the next turn' do
    new_turn_2 = @round.take_turn("venus")

    expect(@round.number_correct)
  end

  it 'can return number correct by category' do
    new_turn_2 = @round.take_turn("venus")

    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'can return a percent for correct answers' do
    new_turn_2 = @round.take_turn("venus")

    expect(@round.percent_correct).to eq(50.0)
  end

  it 'can return percent correct by category' do
    new_turn_2 = @round.take_turn("venus")

    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(@round.current_card).to eq(@card_3)
  end
end
