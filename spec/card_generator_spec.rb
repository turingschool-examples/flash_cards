require './lib/card_generator'
require './lib/card'
require './lib/cards.txt'

RSpec.describe 'card_generator' do
  it 'turns a text file into cards'do

  card_file = File.open(cards.txt)

  expext(card_file).to eq("cards.txt")

  end
end
