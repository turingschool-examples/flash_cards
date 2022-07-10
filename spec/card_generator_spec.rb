require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do 

  before :each do 
    @filename = File.open("./lib/cards.txt")
    file_content = []
    File.readlines(@filename).map do |line|
      file_content << line.gsub("\n", '').split(',')
      file_content.map do |line|
        @cards = Card.new(line[0], line[1], line[2])
      end 
       @cards
    end 
    @card_generator = CardGenerator.new(@filename)
  end 
  it "exists" do 
    expect(@card_generator).to be_instance_of(CardGenerator)
  end 
  it 'cards' do 
    expect(@card_generator.cards).to eq(@cards)
  end 
end 