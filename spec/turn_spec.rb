require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
  it "exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it "has a card" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
    turn = Turn.new("Juneau", card)
    #=> #<Turn:0x00007f99842f0998 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:geography>, @guess="Juneau">

    expect(turn.card).to eq(card)
    #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
  end

  it "has a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it "can tell if answer is correct" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end

  it "can give feedback" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end

  it "can tell if guess is incorrect and give feedback" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.card).to eq(card)
    expect(turn.guess).to eq("Saturn")
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Incorrect.")
  end
end
