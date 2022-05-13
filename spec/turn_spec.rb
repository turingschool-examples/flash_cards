require './lib/turn'
require './lib/card'
require 'rspec'
require 'pry'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end
end

RSpec.describe Turn do
  it 'turn is present' do
      turn = Turn.new("Juneau", @card)

      expect(turn).to be_instance_of(Turn)
    end

  it "returns the card" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to be_instance_of(Card)
    end

  it "the guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
    end

    it "did it match?" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to be(true)
    end

     it "is it correct?" do
       card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       turn = Turn.new("Juneau", card)

       expect(turn.feedback).to eq("Correct!")
     end

end
