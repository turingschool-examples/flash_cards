require_relative 'deck.rb'
require_relative 'turn.rb'

class Round
  attr_reader :deck, :turns, :current_card, :turns_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @turns_correct = []
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    if turn.guess == @current_card.answer
      @turns_correct << turn
    end
    @deck.cards.shift
    @current_card = @deck.cards[0]
    turn
  end

  def number_correct
    @turns_correct.size
  end

  def number_correct_by_category(category)
     return 0 if @turns_correct.none? {|turn| turn.card.category == category}
     cat = @turns_correct.select {|turn| turn.card.category == category}
     cat.size
  end

  def percent_correct
    (@turns_correct.size / @turns.size.to_f) * 100
  end

  def percent_correct_by_category(category)
    return 0 if @turns.none? {|turn| turn.card.category == category}
    total = @turns.select {|turn| turn.card.category == category}
    correct = total.select {|turn| turn.correct == true}
    (correct.size.to_f / total.size) * 100
  end

end
