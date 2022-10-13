# frozen_string_literal: true

# a round of multiple turns, one for each card in deck
class Round
  attr_reader :turns, :deck

  def initialize(deck)
    @deck = deck 
    @turns = [] 
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift 
    return new_turn
  end 

  def number_correct
    @turns.select { |turn| turn.card.answer == turn.guess }.count 

    # correct_count = 0
    # @turns.each do |turn|
    #   if turn.card.answer == turn.guess
    #     correct_count += 1
    #   end
    # end
    # correct_count
  end
end
