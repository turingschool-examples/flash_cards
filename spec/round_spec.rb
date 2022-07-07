require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round.rb'

RSpec.describe Round do
  before :each do
    @card_1 = Card.new(
      "What is the capital of Alaska?",
      "Juneau",
      :Geography)

    @card_2 = Card.new(
      "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
      "Mars",
      :STEM)

    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
      "North north west",
      :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)

  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'keeps track of turns' do
    expect(@round.turns).to be_empty
  end

  it 'has a method to see the current card' do
    expect(@round.current_card).to eq(@card_1)
  end
#to be refactored
  new_turn = round.take_turn("Juneau")

  it 'can take a turn' do

    expect(new_turn.class).to be(Turn)
  end

  it 'evaluates if the turn is correct' do
    expect(new_turn.correct?).to be(true)
  end

  xit 'adds guessed cards to the turns array' do
    expect(@round.turns).to eq([@card_1])
  end

  xit 'keeps track of the number of correct and incorrect turns' do
    expect(round.number_correct).to eq(1)
    expect(round.turns.count).to eq(1)
  end

  xit 'moves to the next card' do
    second_turn = round.take_turn("Venus")
    expect(second_turn).to eq(card_2)
    expect(rounds.turn.count).to eq(2)
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.number_correct).to eq(1)
  end

  xit 'can tell the number correct by category' do
    second_turn = round.take_turn("Venus")
    expect(round.number_correct_by_category(:Geography)).to be(1)
    expect(round.number_correct_by_category(:STEM)).to be(0)
  end

  xit 'can tell percent correct' do
    second_turn = round.take_turn("Venus")
    expect(round.percent_correct).to eq(50.0)
  end

  xit 'can tell percent correct by category' do
    second_turn = round.take_turn("Venus")
    expect(round.percent_correct_by_category(:STEM)).to eq(0.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
  end
# QUESTION: Is it OK to develop the class and the test simultaneously?
end
