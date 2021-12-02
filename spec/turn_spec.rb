require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau", :card)
    expect(turn).to be_instance_of(Turn)
  end

  it "has a guess" do
    turn = Turn.new("Juneau", :card)

    expect(turn.guess).to eq ("Juneau")
  end

  it "Can return a guess as true" do
    turn = Turn.new("Juneau", :card)
    expect(turn.correct?).to eq true
  end

  it "Can return a guess as false" do
    turn = Turn.new("Saturn", :card)
    expect(turn.correct?).to eq false
  end

  it "Gives feedback Correct!" do
    turn = Turn.new("Juneau", :card)
    expect(turn.feedback).to eq "Correct!"
  end

  it "Gives feedback Incorrect.!" do
    turn = Turn.new("Saturn", :card)
    expect(turn.feedback).to eq "Incorrect."
  end 
end
