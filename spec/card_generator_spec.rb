require './lib/card_generator.rb'
# require './lib/cards.txt'
RSpec.describe CardGenerator do
  it 'exists' do
    new_cards = CardGenerator.new('./lib/cards.txt')
    require "pry"; binding.pry
    expect(new_cards).to all(be_a(Card))
  end

end
