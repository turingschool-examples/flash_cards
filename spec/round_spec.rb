require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    @card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_an_instance_of(Round)
  end

  it 'returns an empty array' do
    expect(@round.turns).to eq([])
  end

  it 'show the current card' do 
    expect(@round.current_card).to eq(@card_1)
  end

  it 'Makes a turn into a turn object' do
    new_turn = @round.take_turn("Juneau")
    
    expect(new_turn).to be_an_instance_of(Turn)
  end

  xit 'Shows the new class' do
    new_turn = round.take_turn("Juneau")
    new_turn.class
    
    expect(new_turn.class).to eq(Turn)
  end

  xit 'shows if the answer is correct' do
    new_turn = round.take_turn("Juneau")
    
    expect(new_turn.correct?).to eq(True)
  end

  xit 'shows if the answer is incorrect' do 
    new_turn = round.take_turn("Wrong Answer")
    
    expect(new_turn.correct?).to eq(False)
  end


end
  