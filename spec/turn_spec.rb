# typed: ignore

require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new('question', 'answer', :category)
    @turn = Turn.new('guess', card)
  end

  it 'exists' do
    expect(@turn).to be_an_instance_of(Turn)
  end

  it 'has a card' do
    expect(@turn.card).to be_an_instance_of(Card)
  end

  it 'has a guess' do
    expect(@turn.guess).to be_an_instance_of(String)
  end
end
