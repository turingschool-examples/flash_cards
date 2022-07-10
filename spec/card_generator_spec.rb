require './lib/card_generator'

RSpec.describe CardGenerator do 

  before :each do 
    @filename = File.open("/Users/kenl/Desktop/Turing/1mod/projects/flash_cards/spec/cards.txt")
    @file_content = []
    File.readlines(@filename).each do |line|
      @file_content << line.gsub("\n", '').split(',')
    end  
    @card_generator = CardGenerator.new(@filename)
  end 
  it "exists" do 
    expect(@card_generator).to be_instance_of(CardGenerator)
  end 
  it 'cards' do 
    expect(@card_generator.cards).to eq(@file_content)
  end 
end 