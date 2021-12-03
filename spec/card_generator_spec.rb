require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do
  it 'exists' do
    card_gen = CardGenerator.new
    expect(card_gen).to be_instance_of(CardGenerator)
  end
end
