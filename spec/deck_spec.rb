require "./lib/deck"
require "./lib/card"
require "rspec"

describe Deck do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3] # just an array of the created cards above
    @deck = Deck.new(@cards) # create a new deck with the cards array
  end

  it "initialize" do 
    expect(@deck).to be_instance_of(Deck) # #=> #<Deck:0x00007fa160a38ed8...>
  end

  it "cards" do
    expect(@deck.cards).to eq(@cards) # #=> [#<Card:0x00007fa16104e160...>, #<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]
  end

  it "has deck of cards" do
    expect(@deck.count).to eq(3) #=> 3 for our example
  end

  # will fail due to shuffling the cards
  it "return the cards in a category" do # just checks to ensure that we are getting correct return based on category.
    expect(@deck.cards_in_category(:STEM)).to eq([@card_2, @card_3]) # #=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]
    expect(@deck.cards_in_category(:Geography)).to eq([@card_1]) # #=> [#<Card:0x00007fa16104e160...>]
    expect(@deck.cards_in_category("Pop Culture")).to eq([]) # empty array
  end
end

#documented this one a little better so I could ensure I had all correct answers.