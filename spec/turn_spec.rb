require './lib/turn'
require '.lib/card'

RSpec.describe do
 it 'exist' do
  card = Card.new("What is the capital of Alaska?",
   "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
 end

 it 'exists' do
  turn = Turn.new("Juneau", card)
  expect(turn).to be_instance_of(Turn)
end

end