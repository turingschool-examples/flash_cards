
require './lib/turn'

class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
      if turn.correct? == true
        @number_correct += 1
      end
    return turn

    def number_correct_by_category(category)
      @turns.each do |card_turn|
        if category == card_turn.category
          @number_correct
        end
      end
      @number_correct
    end
  end

  #def number_correct_by_category(category)
    #correct_in_category = 0
  #  @turns.each do |card_turn|
  #    if category == card_turn.category
        #correct_in_category += 1
  #      @number_correct
  #    end
  #  end
    #return correct_in_category
  #end

end
