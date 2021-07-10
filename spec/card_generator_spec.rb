require './lib/card_generator'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


RSpec.describe CardGenerator do


  it 'can handle variable' do
    file_name = './lib/cards.txt'
    cards = CardGenerator.new(file_name)

    expect(cards.create_array.is_a?(Array)).to eq(true)
  end

  it 'can seperate card data' do
    file_name = './lib/cards.txt'
    cards = CardGenerator.new(file_name)



    expect(cards.seperate_array.first).to eq(["What is 1+1?", "2", "Math"])

  end






end
