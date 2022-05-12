require './lib/turn'
require 'rspec'
require 'pry'

RSpec.describe Turn do
  it 'turn is present' do
    turn = Turn.new ("Juneau", card,)

    expect(turn).to_be_an_instance_of(Turn)
  end

  it "returns the card" do
      turn = Turn.new ("Juneau", card,)

      expect(turn.card).to eq (Card)
  end
  it "guess" do
    turn = Turn.new ("Juneau", card,)

    expect(turn.guess). to eq("Juneau")
  end
  it "is guess correct" do
    turn = Turn.new ("Juneau", card,)

    expect(turn.correct) to eq()
  end
  it "user feedback correct or incorrect" do
    turn = Turn.new ("Juneau", card,)

    expect(turn.feedback) to eq()
  end
end
