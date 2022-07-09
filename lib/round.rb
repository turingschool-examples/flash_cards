require'pry'

class Round
  attr_reader :deck, :turns, :correct_answers
  def initialize(deck)
     @deck = deck
     @turns = []
     @correct_answers = 0
  end

  def current_card 
    deck.cards.shift
  end

  def take_turn(prediction)
    card = current_card
    turn =  Turn.new(prediction, card)
    if turn.correct? 
      @correct_answers += 1
    end
    @turns << turn
    turn
  end

  def number_correct 
    correct_answers 
  end

  def number_correct_by_category(category)
    correct_by_category = turns.select do |turn|
      turn.card.answer == turn.guess && turn.card.category == category
    end
    correct_by_category.count
  end

  def percent_correct 
    (number_correct / turns.count.to_f) * 100
  end
end

