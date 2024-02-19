require './lib/card'
require './lib/deck'


RSpec.describe Deck do 
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
   @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)
  end

  it "exists" do
    expect(@deck).to be_instance_of(Deck)
  end

  it "can count the length of the deck" do
    length = @deck.count
    expect(length).to eq(3)
  end

  it "can return specific cards from a category" do
    stem = @deck.cards_in_category(:STEM)
    expect(stem).to eq([@card_2, @card_3])
  end
  

end 