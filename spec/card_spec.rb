require 'rspec'
require './lib/card'
require 'pry'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
#   card2 = Card.new("Which element has the symbol 'C'?", "Carbon", :ReactiveNonmetals)
    expect(card).to be_instance_of(Card)
    # expect(card2).to be_instance_of(Card)
  end

  it 'has a question' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
#   card2 = Card.new("Which element has the symbol 'C'?", "Carbon", :ReactiveNonmetals)
    expect(card.question).to eq("Which element has the symbol 'H'?")
#   expect(card2.question).to eq("Which element has the symbol 'C'?")
  end

  it 'has an answer' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
#   card2 = Card.new("Which element has the symbol 'C'?", "Carbon", :ReactiveNonmetals)
    expect(card.answer).to eq("Hydrogen")
#   expect(card2.answer).to eq("Carbon")
  end

  it 'has a category' do
    card = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
#   card2 = Card.new("Which element has the symbol 'C'?", "Carbon", :ReactiveNonmetals)
    expect(card.category).to eq(:ReactiveNonmetals)
  end

  # it 'has 2 out of 11 questions for this category' do
  # end
  #
  # it 'has 2 out of 11 answers for this category' do
  # end
end
