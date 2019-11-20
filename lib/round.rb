#class file for Round class

class Round
  attr_accessor :deck, :turns, :current_card, :number_correct, :number_correct_by_category

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
    @number_correct = 0
    @number_correct_by_category = Hash.new(0)
  end

  def current_card
    deck.cards[@current_card]
  end

  def take_turn(user_guess)
    current_turn = Turn.new(user_guess, current_card)
    @turns.push(current_turn)
    @number_correct_by_category[current_card.category]
    if current_turn.correct? == true
      @number_correct += 1
      @number_correct_by_category[current_card.category] += 1
    end
    @current_card += 1
    current_turn
  end

  def percent_correct
    (@turns.size.to_f / @number_correct.to_f) * 100
  end

end
