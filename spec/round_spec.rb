require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.describe Round do
  it "exists" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    #=> #<Deck:0x00007fa160a38ed8...>
    round = Round.new(deck)
    #=> #<Round:0x00007f972a1c7960...>

    expect(round).to be_instance_of(Round)
  end

  it "has a deck" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it "starts with an empty list of turns" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it "can show current card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it "can take another turn" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true)
  end

  xit "can keep track of turns" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.turns).to eq([new_turn])
  end

  xit "can keep track of number of correct answers" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.number_correct).to eq(1)
  end

  xit "can show the current card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.current_card).to eq(card_2)
  end


  #rename test???
  xit "can take another turn" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.take_turn("Venus")).to eq()
    # round.take_turn("Venus")
    #=> #<Turn:0x00007f972a215b38...>
    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.number_correct).to eq(1)
  end

  xit "can give number correct by category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  xit "can give percent correct" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.percent_correct).to eq(50.0)
  end

  xit "can give percent correct by category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(round.current_card).to eq(card_3)
  end
end


# round.turns
# #=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]
# round.number_correct
# #=> 1
# round.current_card
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
# round.take_turn("Venus")
# #=> #<Turn:0x00007f972a215b38...>
# round.turns.count
# #=> 2
# round.turns.last.feedback
# #=> "Incorrect."
# round.number_correct
# #=> 1
# round.number_correct_by_category(:Geography)
# #=> 1
# round.number_correct_by_category(:STEM)
# #=> 0
# round.percent_correct
# #=> 50.0
# round.percent_correct_by_category(:Geography)
# #=> 100.0
# round.current_card
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
