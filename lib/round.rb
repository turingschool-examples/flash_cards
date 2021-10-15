require_relative 'turn'
require_relative 'deck'
require_relative 'card'

class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def correct_cards
    right_answers = []
    @turns.each do |turn|
      if turn.feedback == "Correct!"
        right_answers << turn.card
      end
    end
    right_answers
  end

  def number_correct
    correct_cards.count
  end

  def number_correct_by_category(category)
    by_category = []
    correct_cards.each do |card|
      if card.category == category
        by_category << card.category
      end
    end
    by_category.length
  end

  def percent_of

  end

  def percent_correct_by_category(category)
    for_percent_by_cat = []
    correct_cards.each do |card|
      if card.category == category
        for_percent_by_cat << card.category
      end
    end
    (for_percent_by_cat.length / number_correct) * 100
  end

end
