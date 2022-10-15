require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :number_correct, :correct_in_category

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_in_category = []

  end

  def current_card
    deck.cards[0] #When looking or "reading" you don't need @
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    deck.cards.shift
    if new_turn.correct?
      @number_correct += 1
      correct_in_category << new_turn#When modifying, you must have an @
    end
    return new_turn


  end

  def number_correct_by_category(category)

    collector = []
    correct_in_category.each do |turn|
      if turn.card.category == category
      collector << turns
    end
  end

  collector.count

  end




end
