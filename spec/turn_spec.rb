require './lib/turn'
require './lib/card'


RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
  end
end

RSpec.describe Turn do
  it "turn's string is a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq("Juneau")
  end
end


RSpec.describe Turn do
  it "correct answer to question returns true" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("bruh", card)
    # break the code on purpose for troubleshooting
    # replace "bruh" with "Juneau" to make it pass.
    expect(turn.correct?).to eq(true)
  end
end

    # expect(card.question).to eq("What is the capital of Alaska?")
    # expect(card.answer).to eq("Juneau")

    # answer matches question..... pseudocode edition
    # check if turn.guess matches card.answer
    # correct!
    # repeat this


      # if card.answer == this && card.question == this
      # return correct
