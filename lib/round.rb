require 'pry'
class Round
  attr_reader :round,
              :turns,
              :current_card,
              :deck,
              :take_turn

  def initialize(deck)
    @round = round
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @turns.last
    @deck.cards.rotate!
    return new_turn
  end

  def number_correct
    correct_guesses = 0
    @turns.each do |turn|
      if turn.correct?
        correct_guesses += 1
      end
    end
    
    return correct_guesses
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100.0
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / number_correct.to_f) * 100.0
  end
end
