require 'rspec'
require '.lib/card_generator'
require './lib/card'

RSpec.describe Card do
  it 'exists' do
    cards = CardGenerator.new("./cards.txt")
    require "pry"; binding.pry
    expect(card).to be_instance_of(CardGenerator)
  end
end
