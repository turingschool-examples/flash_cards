require './lib/helper.rb'

RSpec.describe Deck do
  let!(:card1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}
  let!(:card2) {Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)}
  let!(:card3) {Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)}
  let!(:cards) {[card1, card2, card3]}
  let!(:deck) {Deck.new(cards)}

  it "is an instance of" do
    expect(deck).to be_a Deck
  end

  it "has cards" do
    expect(deck.cards).to eq(cards)
  end

  it "can count the number of cards" do
    expect(deck.cards.count).to eq(3)
  end

  it "can locate cards in a specific category" do
    expect(deck.cards_in_category(:STEM)).to eq([card2, card3])
  end
end
