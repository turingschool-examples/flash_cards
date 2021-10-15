# require './lib/turn'
require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

RSpec.describe Deck do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)

    ## flashcard_runner.rb 
    # @card_1 = Card.new("What is the capital of Alaska?",
    #    "Juneau", :Geography)
    # @card_2 = Card.new("What is the capital of North Carolina?",
    #    "Raleigh", :Geography)
    # @card_3 = Card.new("A ____ triangle that contains a 90 degree angle.",
    #    "Right", :STEM)
    # @card_4 = Card.new("What object-oriented programming language is also a precious gem?",
    #    "Ruby", :STEM)
    # @cards = [@card_1, @card_2, @card_3, @card_4]
    # @deck = Deck.new(@cards)
    # @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it '#deck' do
    expect(@round.deck).to be_instance_of(Deck)
  end

  it '#turns 1' do
    expect(@round.turns).to eq([])
  end

  it '#current_card 1' do
    expect(@round.current_card).to eq(@card_1)
  end

  it '#take_turn.class' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn).to be_instance_of(Turn)
  end

  it '#take_turn.correct?' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn).to be_instance_of(Turn)
    expect(new_turn.card).to eq(@card_1)
    expect(new_turn.guess).to eq(@card_1.answer)
  end

  it '#turns 2' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.turns).to eq([new_turn])
  end

  it '#number_correct' do
    @round.take_turn("Juneau")
    expect(@round.number_correct).to eq(1)
  end

  it '#current_card 2' do
    @round.take_turn("Juneau")
    expect(@round.current_card).to eq(@card_2)
  end

  it '#turns.count' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.turns.count).to eq(2)
  end

  it '#turns.last.feedback' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.turns.last).to be_instance_of(Turn)
    expect(@round.turns.last.feedback).to eq('Incorrect.')
  end

  it '#number_correct' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.number_correct).to eq(1)
  end

  it '#number_correct_by_category' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:STEM)).to eq(0)
  end

  it '#percent_correct' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.percent_correct).to eq(50.0)
  end

  it '#percent_correct_by_category' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    # expect(@round.number_correct_by_category(:STEM)).to eq(0)
  end

  it '#current_card 3' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.current_card).to eq(@card_3)
  end
end
