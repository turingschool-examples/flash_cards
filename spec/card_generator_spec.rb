require './lib/card'
require './lib/card_generator'
require 'pry'



RSpec.describe CardGenerator do
  card_1 = Card.new("What is 5 + 5?", "10", "STEM")
  card_2 = Card.new("What is Rachel's favorite animal?", "red panda", "Turing Staff")
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
  cards = CardGenerator.new("cards_spec.txt").cards
  describe 'cards' do
    expect(card_generator.cards).to eq([card_1, card_2, card_3, card_4])
  end
end
