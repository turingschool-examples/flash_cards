 require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    $card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    $card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    $card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect($card_1).to be_instance_of(Card)
    expect($card_2).to be_instance_of(Card)
    expect($card_3).to be_instance_of(Card)

  end
end 
