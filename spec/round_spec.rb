require './lib/round'

RSpec.describe Round do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)
  end

  it 'the round exists' do
    expect(@card_1).to be_instance_of(Card)
    expect(@deck).to be_instance_of(Deck)
    expect(@round).to be_instance_of(Round)
  end

  it 'has a deck' do
    expect(@round.deck).to eq(@deck)
  end

  it 'has rounds' do
    expect(@round.turns).to eq([])
  end

  it 'round has a current card' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'takes turns' do
    new_turn = @round.take_turn("Juneau")

    expect(@round.take_turn("Juneau")).to be_instance_of(Turn)
    expect(new_turn).to be_instance_of(Turn)
  end

  it 'checks if guess is correct' do
    new_turn = @round.take_turn("Juneau")

    expect(new_turn.correct?).to eq(true)
  end

  it 'keeps track of turns' do
    new_turn = @round.take_turn("Juneau")

    expect(@round.turns).to eq([new_turn])
  end

  it 'keeps track of correct guesses' do
    new_turn = @round.take_turn("Juneau")

    expect(@round.number_correct).to eq(1)
  end

  it 'changes the current card' do
    new_turn = @round.take_turn("Juneau")

    expect(@round.current_card).to eq(@card_2)
  end

  it 'takes a different turn' do
    @round.take_turn("Venus")
    expect(@round.take_turn("Venus")).to be_instance_of(Turn)
    expect(@round.turns.count).to eq(2)
  end

  it 'provides feedback to incorrect guesses' do
    @round.take_turn("Venus")
    expect(@round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'does not count every guess as correct' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.number_correct).to eq(1)
  end

  it 'provides the number correct by category' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'calculates percent correct' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.percent_correct).to eq(50.0)
  end

  it 'calculates percent correct by category' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
  end

end
