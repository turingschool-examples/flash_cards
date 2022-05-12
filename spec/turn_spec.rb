require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    current_turn = Turn.new("This is the guess", "This might be the question?") #placeholder = current card, whatever object that is

    expect(current_turn).to be_instance_of(Turn)
  end

  it 'has guess' do
    current_turn = Turn.new("This is the guess", "This might be the question?")

    expect(current_turn.guess).to eq("This is the guess")
  end
#
#   it 'has an answer' do
#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     expect(card.answer).to eq("Juneau")
#   end
#
#   it 'has a category' do
#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     expect(card.category).to eq(:Geography)
#   end
end
