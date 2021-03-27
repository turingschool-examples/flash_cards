require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Messages
  attr_reader  :card_1,
                    :card_2,
                    :card_3,
                    :card_4,
                    :deck,
                    :round

  def initialize(card_1, card_2, card_3, card_4)
    @card_1 = Card.new("What is the name of the greatest coding bootcamp ever established?", "turing", :Geography)
    @card_2 = Card.new("What's the name of the Big Red Dog?", "clifford", :Wisdom)
    @card_3 = Card.new("Is an avocado a fruit or a vegetable?", "fruit", :Science)
    @card_4 = Card.new("What is the return value of .each?", "the original array", :Wisdom)
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @round = Round.new(deck)
  end

  def separator
    "- " * 50
  end

  def welcome
    "Welcome to flashcards!"
  end

  def amount_of_cards
    "You're playing with #{deck.count} cards."
  end

  def quit_info
    "You can press 'q' to quit at any time....but it would be really fun if you play!"
  end

  def card_out_of(card)
    "This is card number #{deck.card_num(card)} out of #{deck.count}."
  end

  def questions(card)
    "Question: #{card.question}"
  end

  def quit
    "Okay, guess you're done now, bummer."
  end
end
