require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'rspec'

RSpec.describe Round do
  before :each do
   @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
   @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
   @cards = [@card_1, @card_2, @card_3]
   @deck = Deck.new(@cards)
   @round = Round.new(@deck)
   #@new_turn = @round.take_turn("Juneau")
 end

 it 'exists' do

   expect(@round).to be_instance_of(Round)
 end

  it 'has a deck you can play with' do

    expect(@round.deck).to eq(@deck)
  end

  it 'has turns you can take' do

    expect(@round.turns).to eq([])
  end

  it 'has one current card per round' do

    expect(@round.current_card).to eq(@card_1)
  end

  it 'has different turns you can take' do
    @new_turn = @round.take_turn("Juneau")
    #@round = Round.new(@deck)
    #(@round.take_turn(@guess).correct?).to eq(true)
    expect(@round.correct_turns.count).to eq(1)
  end

  it 'tells you when you guessed correct' do
    @new_turn = @round.take_turn("Juneau")

    expect(@new_turn.correct?).to eq(true)
  end

  it 'tells you what turn you are on' do
    @new_turn = @round.take_turn("Juneau")

    expect(@round.turns).to eq([@new_turn])
  end

it 'tell you how many you guess correct' do
   @new_turn = @round.take_turn("Juneau")

   expect(@round.number_correct).to eq(1)
  end

it 'can move to the next turn' do
  @new_turn = @round.take_turn("Juneau")

  @round.take_turn("Venus")
end

it 'counts how many turns you have taken' do
  @new_turn = @round.take_turn("Juneau")
  @round.take_turn("Venus")

  expect(@round.turns.count).to eq(2)
end

it 'tell you the number correct by category' do
  @new_turn = @round.take_turn("Juneau")
  @round.take_turn("Venus")

  expect(@round.number_correct_by_category(:Geography)).to eq(1)
  expect(@round.number_correct_by_category(:STEM)).to eq(0)
end

it 'tells you the percent correct' do
  @new_turn = @round.take_turn("Juneau")
  @round.take_turn("Venus")

  expect(@round.percent_correct).to eq(50.0)
end

it 'tells you the percent correct by category' do
  @new_turn = @round.take_turn("Juneau")
  @round.take_turn("Venus")

  expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
end
#  it 'has a new turn' do
#
#    expect(@new_turn).to be_instance_of(Turn)
#  end
end
