require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @card_4 = Card.new("What's 4 + 3?", 7, :Math)
    @deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'returns the deck' do
    expect(@round.deck).to eq(@deck)
  end

  it 'starts out with no turns' do
    expect(@round.turns).to eq([])
  end

  it 'shows current card' do
    expect(@round.current_card).to eq(@deck.cards.first)
  end

  it 'can take a turn' do
    new_turn = @round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
  end

  it 'works for correct guesses' do
    new_turn = @round.take_turn("Juneau")

    expect(new_turn.correct?).to be true
  end

  it 'records turns' do
    new_turn = @round.take_turn("Juneau")

    expect(@round.turns).to eq([new_turn])
  end

  it 'tracks # of correct answers' do
    new_turn = @round.take_turn("Juneau")

    expect(@round.number_correct).to eq(1)
  end

  it 'moves to the next card' do
    new_turn = @round.take_turn("Juneau")

    expect(@round.current_card).to eq(@deck.cards.first)
  end

  it 'moves to the next card' do
    new_turn = @round.take_turn("Juneau")
    turn_2 = @round.take_turn("Venus")

    expect(@round.turns.count).to eq(2)
    expect(@round.turns.last.feedback).to eq('Incorrect.')
    expect(@round.number_correct).to eq(1)
  end

  it 'keeps track of number correct in each category' do
    new_turn = @round.take_turn("Juneau")
    turn_2 = @round.take_turn("Venus")

    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'tracks percent correct' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.percent_correct).to eq(50.0)
  end

  it 'tracks percent correct by category' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")
    @round.take_turn(8)

    expect(@round.percent_correct_by_category(:Geography)).to eq (100.0)
    expect(@round.percent_correct_by_category(:STEM)).to eq (50.0)
    expect(@round.percent_correct_by_category(:Math)).to eq (0.0)
  end

  it 'moves to the next card' do
    new_turn = @round.take_turn("Juneau")
    turn_2 = @round.take_turn("Venus")

    expect(@round.current_card).to eq(@deck.cards.first)
  end
end
