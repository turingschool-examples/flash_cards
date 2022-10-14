require './lib/deck'
require './lib/card'
require './lib/turn'

class Round
  attr_reader :deck, :turns, :correct, :incorrect
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct= []
    @incorrect = []
  end

  def current_card
    deck.cards.first
  end


  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @correct << turn
    else
      @incorrect << turn
    end
    deck.cards.rotate!
    turn
  end


  def number_correct
    correct.length
  end


  def percent_correct
    (100.0 * number_correct / turns.length).round
  end


  def percent_correct_by_category(category)
    (100.0 *
    number_correct_by_category(category) /
    deck.cards_in_category(category).length).round


  end


  def correct_by_category(category)
    correct_cards = correct.map do |turn|
      turn.card
    end
    correct_by_category = deck.cards_in_category(category).select do |card|
      correct_cards.include?(card)
    end
  end


  def number_correct_by_category(category)
    correct_by_category(category).length
  end

end
