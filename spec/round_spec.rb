require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'uses a deck' do
    expect(@round.deck).to eq(@deck)
  end

  it 'has a current_card' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'takes a turn' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true)
  end

  it 'saves the turn' do
    expect(@round.turns).to eq([])
    new_turn = @round.take_turn("Juneau")
    expect(@round.turns).to eq([new_turn])
    next_turn = @round.take_turn("Mars")
    expect(@round.turns).to eq([new_turn, next_turn])
  end

  it 'gives the number of correct answers' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct).to eq(1)
    next_turn = @round.take_turn("Mars")
    expect(@round.number_correct).to eq(2)
  end

  it 'advances to the next card after each turn' do
    expect(@round.current_card).to eq(@card_1)
    new_turn = @round.take_turn("Juneau")
    expect(@round.current_card).to eq(@card_2)
    next_turn = @round.take_turn("Mars")
    expect(@round.current_card).to eq(@card_3)
  end
end

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    new_turn = @round.take_turn("Juneau")
    next_turn = @round.take_turn("Mars")
    last_turn = @round.take_turn("South")
  end

  it 'counts the number of correct answers' do
    expect(@round.number_correct).to eq 2
    expect(@round.turns.count).to eq 3
    expect(@round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'counts the number of correct answers' do
    expect(@round.number_correct).to eq 2
    expect(@round.turns.count).to eq 3
    expect(@round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'counts correct answers by category' do
    @round.number_correct_by_category(:Geography)
    expect(@round.number_correct_by_category(:Geography)).to eq 1
    expect(@round.number_correct_by_category(:STEM)).to eq 1
  end

  it 'calculates percent correct' do
    expect(@round.percent_correct).to eq(66.7)
  end

  it 'calculates percent correct by category' do
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(@round.percent_correct_by_category(:STEM)).to eq(50.0)
  end

  it 'stays on last card when end of deck is reached' do
    expect(@round.current_card).to eq(@card_3)
  end
end
