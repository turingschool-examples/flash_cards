require './lib/turn'
require 'pry'

class Round
  attr_reader :deck, :turns, :correct_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    # I originally had correct turn as an empty array to store correct turns, but changed
    # @correct_turn to a counter since I'm not sure it's necessary to store the entire turn
    #@correct_turn = []
    @correct_turn = 0
  end

  def current_card
    deck.cards.first
    # @deck.find_all do |card|
    #   return [card]
  end

  def take_turn(guess)
    # binding.pry
    @correct_turn += 1 if guess == current_card.answer
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    # return new_turn
    deck.cards.delete_at(0)
    new_turn
  end

  def number_correct
    @correct_turn
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.guess == turn.card.answer
    end.count
  end
end
