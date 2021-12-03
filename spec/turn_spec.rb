require './lib/turn'
require './lib/card'


RSpec.describe Turn do
  it 'exists' do
    card = Card.new("How many ferrets does Ian have?", "3", :Myself)
    turn = Turn.new("3", card)
    expect(turn).to be_instance_of(Turn)
  end

  it "is correct?" do
    card = Card.new("How many ferrets does Ian have?", "3", :Myself)
    turn = Turn.new("3", card)
    expect(turn.correct?)
  end
end
