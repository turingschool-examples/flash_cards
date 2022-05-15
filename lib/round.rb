# require './lib/turn'

class Round
  attr_reader :turns, :number_correct
  attr_accessor :deck
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card()
    return @deck.cards[0]
  end

  def take_turn(guess)
    # require 'pry'; binding.pry
    this_turn = Turn.new(guess, current_card())
    @turns << this_turn
    if this_turn.guess == current_card().answer
      @number_correct += 1
    end
    deck.cards.rotate!
    return this_turn
  end

  def number_correct_by_category(category)

    number_correct_by_category = 0
    i = 0
    while i < turns.length
      if turns[i].card.category == category && turns[i].guess == turns[i].card.answer

           number_correct_by_category +=1
      end
      i += 1
    end
    return number_correct_by_category
  end
end
