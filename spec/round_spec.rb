require './lib/card'
require './lib/deck'
require './lib/round'


RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
   @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)
  end

  it "initializes the getter methods for deck, current_card, and turns" do
    round = Round.new(@deck)
    deck = round.deck
    current_card = round.current_card
    turns = round.turns

    expect(deck).to eq(@deck)
    expect(current_card).to eq(@deck.cards[0])
    expect(turns).to eq([])
  end

  it "take a turn" do 
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.card).to eq(@card_1)
    expect(new_turn.guess).to eq("Juneau")

  end

  it "return if the guess is correct" do 
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneau")
    expect(new_turn.correct?).to eq(true)
  end 

  it "return the correct number of turns" do 
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneau")
    expect(round.number_correct).to eq(1)
  end 

  it "return the new current card" do 
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneau")
    expect(round.current_card).to eq(@card_2)
  end 

  it "return the new number of correct turns" do 
    round = Round.new(@deck)
    round.take_turn("Juneau")
    second_round = round.take_turn("Venus")
    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq("Incorrect")
    expect(round.number_correct).to eq(1)
  end 

  it "return the number of correct turns by category " do 
    round = Round.new(@deck)
    round.take_turn("Juneau")
    correct_round1 = round.number_correct_by_category(:Geography)
    expect(correct_round1).to eq(1)
    
  end

  it "return the number of correct by category on the second turn - incorrect" do 
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")
    correct_round1 = round.number_correct_by_category(:STEM)
    expect(correct_round1).to eq(0)
  end

  it "return the number of correct by category on the second turn - correct" do 
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Mars")
    correct_round1 = round.number_correct_by_category(:STEM)
    expect(correct_round1).to eq(1)
  end



end