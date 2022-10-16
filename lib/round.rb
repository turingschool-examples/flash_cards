
require './lib/turn'

class Round
  attr_reader :deck, :turns, :number_correct, :correct_in_category

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_in_category = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    #@deck.cards.shift
      if turn.correct? == true
        @number_correct += 1
        correct_in_category << turn
      end
    @deck = Deck.new(@deck.cards.rotate(1))
    return turn
  end

  def number_correct_by_category(category)
      collector = []
      correct_in_category.each do |turn|
        if turn.card.category == category
          collector << turn
       end
    end
    collector.count

  end

  def percent_correct
   ((@number_correct.to_f / turns.count.to_f) * 100).round(1)
  end

  def percent_correct_by_category(category)
      (number_correct_by_category(category).to_f / deck.cards_in_category(category).count.to_f * 100).round(1)
  end

end
