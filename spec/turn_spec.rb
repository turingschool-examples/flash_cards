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

  it 'will return current card' do
    current_turn = Turn.new("This is the guess", "This might be the question?")

    expect(current_turn.card).to eq("This might be the question?")
  end
#
#   it 'has a category' do
    # current_turn = Turn.new("This is the guess", "This might be the question?")
#
#     expect(card.category).to eq(:Geography)
#   end
end
