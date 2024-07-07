require './lib/card'

class Round
  attr_reader :deck, :turns, :current_card, :turn_counter, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 0
    @current_card = @deck.cards[@turn_counter]
    @number_correct = 0
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    turns.push(turn)
    @guess = guess
    new_card
    @turn_counter += 1
    @number_correct += 1 if turn.correct?
    turn
  end

  def new_card
    @current_card = @deck.cards[@turn_counter]
  end

  def number_correct_by_category(category)
    correct_for_category = []
    @turns.each do |turn|
      if category == turn.card.category && turn.correct?
        correct_for_category << turn.card
      end
      end
      correct_for_category.count
  end
  
  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
  
    end
  end

end
