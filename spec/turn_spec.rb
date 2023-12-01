require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    
    expect(turn).to be_instance_of(Turn)
  end

  it "has a card" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq card
  end

  it "have a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq "Juneau"
  end

  it "can attest is the guess is correct" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq true
  end

  it "can test if the guess is incorrect" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.correct?).to eq false
  end

  it "can give feedback" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)

    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn_2 = Turn.new("Saturn", card_2)

    expect(turn_1.feedback).to eq "Correct!"
    expect(turn_2.feedback).to eq "Incorrect."
  end
end