require './lib/card_generator'

RSpec.describe CardGenerator do
  before :each do
    filename = './lib/cards.txt'
    @cards = CardGenerator.new(filename)
  end

  it 'exists' do
    expect(@cards).to be_instance_of(CardGenerator)
  end
end
