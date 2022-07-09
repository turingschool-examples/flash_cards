require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)#Create new turn object with guess and card
    @turns << new_turn #Store this new turn object in @turns

    if new_turn.correct? == true
      @number_correct += 1
    end

    def feedback
      if new_turn.correct? == false
        "Incorrect."
      end
    end
    @deck.cards.shift#Change current card to next card in array - push out first element

    new_turn #Return it
  end

  def number_correct_by_category(category_turn)
    category_correct = 0

    @turns.each do |turn|
      if turn.card.category == category_turn && turn.correct? == true
        category_correct += 1
      end
   end
   category_correct
 end

end
