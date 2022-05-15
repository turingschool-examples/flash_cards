require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe "Flashcard_runner" do
  it "exists" do
  card_1 = Card.new("What is 5 + 5?", "10", :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", "red panda", :Turing_Staff)
  card_3 = Card.new("What is Mike's middle name", "nobody knows", :Turing_Staff)
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)
  new_turn = round.take_turn("10")
  round.take_turn("panda")
  round.take_turn("nobody knows")
  round.take_turn("Justin Bieber")

  expect(round.number_correct_by_category(:Turing_Staff)).to eq(1)
  expect(round.number_correct_by_category(:STEM)).to eq(1)
  expect(round.number_correct_by_category("Pop Culture")).to eq(1)
end
end
