require 'pry'

class Round
  number_correct = 0

  attr_accessor :deck, :turns

  def initialize (deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.shift
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    correct = 0
    @turns.each do |turn|
      if turn.guess == turn.answer
        correct += 1
      end

    end

  end

end

#use find to get all the correct? is true to see percentage true
