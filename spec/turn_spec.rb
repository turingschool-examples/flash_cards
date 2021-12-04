require './lib/turn'
require './lib/card'


describe Turn do
  it 'exists' do
    card = Card.new("How many ferrets does Ian have?", "3", :Myself)
    turn = Turn.new("3", card)
    expect(turn).to be_instance_of(Turn)
  end

  it "is correct?" do
    card = Card.new("How many ferrets does Ian have?", "3", :Myself)
    turn = Turn.new("3", card)
    expect(turn.correct?).to eq(true)
  end

#   it "give feedback" do
#     card = Card.new("How many ferrets does Ian have?", "3", :Myself)
#     turn = Turn.new("3", card)
#     expect(turn.feedback).to eq("Correct!")
#   end
# end
