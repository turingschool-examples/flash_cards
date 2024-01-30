# typed: ignore

require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  card = Card.new('question', 'answer', :category)
  turn = Turn.new('guess', card)

  it 'exists' do
    expect(turn).to be_an_instance_of(Turn)
  end

  it 'has a card' do
    expect(turn.card).to be_an_instance_of(Card)
  end

  it 'has a question' do
    expect(turn.question).to be_an_instance_of(String)
  end

  it 'has an answer' do
    expect(turn.answer).to be_an_instance_of(String)
  end

  it 'has a guess' do
    expect(turn.guess).to be_an_instance_of(String)
  end

  it 'has a category' do
    expect(turn.category).to be_an_instance_of(Symbol)
  end
end
