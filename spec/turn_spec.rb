require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

RSpec.describe Turn do

  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#this section is wrong. I believe I need to use each here, but, really unsure of how to use it.
end

it 'exists' do
  expect(turn).to be_instance_of(Turn)
end

it 'has a guess' do
  expect(turn.guess).to eq("Juneau") #I know that I need to use method chaining here, but, uncertain
  #if this is correct
end
