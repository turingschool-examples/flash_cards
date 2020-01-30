require './lib/turn'
class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_turn
    @number_correct = 0
  end

  def current_card
    @deck.cards[@turns.size]
  end

  def take_turn(guess)
    @current_turn = Turn.new(guess, current_card)
    @turns << @current_turn
    if @current_turn.correct?
      @number_correct += 1
    end
    @current_turn
  end

  def number_correct_by_category(category)
    count = 0
    @turns.each do |turn|
      if category == turn.card.category
        if turn.correct?
          count += 1
        end
      end
    end
    count
  end
end
