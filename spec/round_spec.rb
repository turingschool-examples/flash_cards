require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

describe 'Round' do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'will have an instance of a Round' do

    expect(@round).to be_instance_of Round
  end

  it 'will be able to read the deck variable' do

    expect(@round.deck).to eq @deck
  end

  it 'will be able to take turns' do
    @round.turns

    expect(@round.turns).to eq []
  end

  it 'will show the current card' do
    @round.current_card

    expect(@round.current_card).to eq @card_1
  end

  it 'exepects new turn to be in the turn class' do
    @round.current_card
    new_turn = @round.take_turn("Juneau")

    expect(new_turn).to be_instance_of Turn
  end

  it 'expects that that right answer was passed into new turn' do
    @round.current_card
    new_turn = @round.take_turn("Juneau")
    new_turn.correct?

    expect(new_turn.correct?).to eq true
  end

  it 'expects the current card to move into the turns array after guessing' do
    @round.current_card
    new_turn = @round.take_turn("Juneau")

    expect(@round.turns).to eq [new_turn]
  end

  it 'counts the number of correct guesses' do
    @round.current_card
    new_turn = @round.take_turn("Juneau")

    expect(@round.number_correct).to eq 1
  end

  it 'shows that the current card advances after each turn' do
    new_turn = @round.take_turn("Juneau")
    @round.current_card

    expect(@round.current_card).to eq @card_2
  end

  it 'shows that cards are moving to the turns array each round' do
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.turns.count).to eq 2
  end

  it 'can display feedback from the last card response' do
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.turns.last.feedback).to eq "Incorrect."
  end

  it 'shows that the number correct counter is working prorperly' do
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.number_correct).to eq 1
  end

  it 'shows that number of correct answers can be listed by category' do
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.number_correct_by_category(:Geography)).to eq 1
  end

  it 'shows the correct by category function actually works' do
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.number_correct_by_category(:STEM)).to eq 0
  end

  it 'shows the percent of correct answers' do
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.percent_correct).to eq 50.0
  end

  it 'shows the percent correct by category' do
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.percent_correct_by_category(:Geography)).to eq 100.0
  end

  it 'shows that the card moves forward after each guess' do
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    
    expect(@round.current_card).to eq @card_3
  end

end
