require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

RSpec.configure do |config|
  config.formatter = :documentation
  end

RSpec.describe Deck do
  before(:each) do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  end



  it 'exists' do
    deck = Deck.new(@cards)
    expect(deck).to be_instance_of(Deck)
  end
end



# cards = [card_1, card_2, card_3]

#   it 'has a new card' do
#     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#     cards = [card_1, card_2, card_3]
#     deck = Deck.new(@cards)
#     expect(deck.cards).to eq([card_1, card_2, card_3])
#   end
# end


  # xit "shows cards" do
  #   cards = [card_1, card_2, card_3]
  #   deck = Deck.new(@cards)
  #   expect(deck.cards).to eq([card_1, card_2, card_3])
  # end
