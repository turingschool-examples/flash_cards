require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
  it "exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  xit "has a card" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
    turn = Turn.new("Juneau", card)
    #=> #<Turn:0x00007f99842f0998 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:geography>, @guess="Juneau">

    expect(turn.card).to ea(card)
    #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
  end

  xit "has a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  xit "can tell if answer is correct" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end

  xit "can give feedback" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end
end


# card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
# #=> #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>
# turn = Turn.new("Saturn", card)
# #=> #<Turn:0x00007f998413ee60 @card=#<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>, @guess="Saturn">
#
# turn.card
# => #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>
#
# turn.guess
# => "Saturn"
#
# turn.correct?
# => false
#
# turn.feedback
# => "Incorrect."
