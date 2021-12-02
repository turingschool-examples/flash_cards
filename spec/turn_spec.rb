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
end


#require 'pry'; binding.pry
