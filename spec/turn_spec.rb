require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Janeau", card)

    expect(turn).to be_instance_of(Turn)
  end


  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Janeau", card)
    expect(turn.guess).to eq("Janeau")
  end

  # it 'determines guess is correct' do
  #   card = Card.new("What is the capital of Alaska?", "Juneau",: Geography)
  #   turn = Turn.new("Juneau", card)
  #   expect(card.guess). to eq("")
  #   end
   
  # end
#   it 'has a correct guess' do
#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#     turn = Turn.new("Janeau", card)
#     expect(turn.correct?).to eq(true)
#   end

#   it "has an incorrect guess" do
#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#     turn = Turn.new("Incorrect", card) 

#     expect(turn.correct?).to eq(false)
#   end

#   xit "gives feedback for correct answer" do
#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#     turn = Turn.new("Juneau", card) 

#     expect(turn.feedback).to eq("Correct!")
#   end

#   xit "gives feedback for incorrect answer" do
#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#     turn = Turn.new("", card) 

#     expect(turn.feedback).to eq("Incorrect.")
#   end


end

