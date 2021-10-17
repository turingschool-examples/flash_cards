require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


RSpec.describe Round  do

  before(:each) do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
       reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5°
      clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    @round = Round.new(deck)

  end


  it 'round.turns test' do
    expect(@round.turns). to eq([])
  end


  it 'round.current card test' do
    expect(@round.current_card). to eq(@round.deck.cards[0])
  end


  it 'new_turn.class' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.class). to eq(Turn)
  end

  it 'new_turn.correct?' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.correct?). to eq(true)
  end

  it 'round.number_correct' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct). to eq(1)
  end


  it 'round.number_correct_by_category(:Geography)' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct_by_category(:Geography)). to eq(1)
  end

  # finish
  it 'round.number_correct_by_category(:STEM)' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct_by_category(:STEM)). to eq(0)
  end

  # # finish
  # it 'round.percent_correct' do
  #   # new_turn = @round.take_turn("Juneau")
  #   expect(@round.number_correct). to eq(1)
  # end
  #
  # # finish
  # it 'round.percent_correct_by_category(:Geography)' do
  #   # new_turn = @round.take_turn("Juneau")
  #   expect(@round.number_correct). to eq(1)
  # end
  #
  # # finish
  # it 'round.current_card)' do
  #   # new_turn = @round.take_turn("Juneau")
  #   expect(@round.number_correct). to eq(1)
  # end
  #


end
