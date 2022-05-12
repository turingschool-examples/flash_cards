require './lib/turn'
require 'rspec'
require 'pry'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end

  it 'turn is present' do
    turn = Turn.new ("Juneau", card)

    expect(turn).to_be_instance_of(Turn)
  end

#   xit "returns the card" do
#       turn = Turn.new ("Juneau", card)
#
#       expect(turn.card).to eq (Card)
#   end
#
#   xit "the guess" do
#     turn = Turn.new ("Juneau", card)
#
#     expect(turn.guess).to eq(turn.users_guess)
#   end
#
#   xit "is guess correct" do
#     turn = Turn.new ("Juneau", card)
#
#     expect(turn.correct?).to eq(Card.answer)
#   end
#
#   xit "user feedback correct or incorrect" do
#     turn = Turn.new ("Juneau", card)
#
#     expect(turn.feedback).to eq(turn.guess_result)
#   end
# end
