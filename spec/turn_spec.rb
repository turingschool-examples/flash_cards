require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau",card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess). to eq("Juneau")
  end

  it 'has a valid card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.card). to eq(card)
  end

  it 'checks if the guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?). to eq(true)
  end

  it 'provides feedback on the test' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback). to eq("Correct!")
  end

#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

#     expect(card.question).to eq("What is the capital of Alaska?")
#   end

#   it 'has an answer' do
#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

#     expect(card.answer).to eq("Juneau")
#   end

#   it 'has a category' do
#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

#     expect(card.category).to eq(:Geography)
#   end
end
