require './lib/turn'
require './lib/card'



RSpec.describe Turn do
  it "instance of card exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card).to be_instance_of(Card)
  end

  it "instance of turn exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end

  it "Turn card happens" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    #require 'pry'; binding.pry
    expect(turn.card).to eq(card)
  end

  it "guess happens" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq("Juneau")
  end
 
  it "the guess is correct" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to eq(true)
  end

  it "sends feedback" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq("Correct!")
  end

  it "pulls a new card" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.card).to eq(card)
  end

  it "takes a guess" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.guess).to eq("Saturn")
  end

  it "is the guess correct?" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.correct?).to eq(false)
  end

  it "gives feedback of Incorrect" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.feedback).to eq("Incorrect.")
  end



end


#require 'pry'; binding.pry
