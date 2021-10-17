require './lib/turn'
require './lib/card'


describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end
end

describe Turn do
  it "turn's string is a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq("Juneau")
  end
end


describe Turn do
  it "correct answer to question returns true" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    expect(turn.correct?).to eq(true)
      # require 'pry'; binding.pry
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
