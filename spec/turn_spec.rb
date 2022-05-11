require 'rspec'
require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
  it 'has a correct answer' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    turn = Turn.new("Hydrogen", card)
  end
end
