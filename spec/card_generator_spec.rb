require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

RSpec.describe CardGenerator do
  before :each do
    @data = File.open('./lib/cards.txt').readlines.map(&:chomp)
    @card_generator = CardGenerator.new(@data)
  end

  it 'exists & has attributes' do
    expect(@card_generator).to be_a(CardGenerator)
    expect(@card_generator.data).to eq(@data)
  end
end






# Things you need in your spec file

# A way to confirm that you are passing your card.txt file into filename

#A Method to format the lines of text that the class file is receiving

#After its formatted, it needs to be
