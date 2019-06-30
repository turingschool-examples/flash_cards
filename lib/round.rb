require './lib/card'
require './lib/turn'
require './lib/deck'
class Round
  attr_reader :deck,:turns
  def initialize(deck)
    @deck = deck
    @turns = []

  end

def current_card
@deck.cards[0]

end

def take_turn(guess) #takes the turn
new_turn = Turn.new(guess, current_card)
@turns << new_turn
@deck.cards.rotate
current_card = @deck.cards[0]
new_turn
end

def amount_correct #aggregates the amnount correct
  number_correct = 0
  @turns.each do |turn|
    if turn.correct?
      number_correct += 1
    end
  end
  number_correct
end

def number_correct_by_category(category)
    number_correct_category = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
       number_correct_category += 1
      end
    end
    return number_correct_category
  end

  def percent_correct
      (number_correct.to_f  / @turns.count) * 100
    end

    def percent_correct_category(category)
      turn_cat = @turns.find_all do |turn|
        turn.card.category == category
      end.count
      number_correct_by_category(category).to_f / turn_cat * 100.0
    end


end #end class
