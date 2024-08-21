require './lib/card'
require './lib/turn'

card_1  = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")
it 'has a question' do
  card_1 = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", :Personal)

  expect(card.question).to eq("What is Dr. Brown's specialty?")
end
it 'has an answer' do
  card_1 = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", :Personal)

  expect(card.answer).to eq("Ultrasonography")
end

it 'has a category' do
  card_1 = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", :Personal)

  expect(card.category).to eq(:Personal)
end

require 'pry'; binding.pry

#RSpec.describe Card do
  #it 'exists' do
   # card = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", :Personal)

    #expect(card).to be_instance_of(Card)
  #end
#end
