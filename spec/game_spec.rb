require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game'
require 'pry'

RSpec.describe Game do
  card_1 = Card.new("What is 5 + 5?", "10", "STEM")
  card_2 = Card.new("What is Rachel's favorite animal?", "red panda", "Turing Staff")
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)
  game = Game.new(round)
  describe 'number_of_cards' do
    it 'displays the total number of cards' do
      # binding.pry
      expect(game.number_of_cards).to eq(4)
    end
  end

  describe 'array_of_categories' do
    turn_1 = round.take_turn("10")
    it 'generates an array containing all categories' do
      expect(game.array_of_categories).to eq(["STEM", "Turing Staff", "Pop Culture"])
    end
  end
end
