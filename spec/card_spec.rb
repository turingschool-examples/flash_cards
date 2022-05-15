require 'rspec'
require './lib/card'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    expect(card).to be_instance_of(Card)
  end

  it 'has a question' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    expect(card.question).to eq("Which element has the symbol 'H'?")
  end

  it 'has an answer' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    expect(card.answer).to eq("Hydrogen")
  end

  it 'has a category' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    expect(card.category).to eq(:ReactiveNonmetals)
  end

end
