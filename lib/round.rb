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
  def percent_correct
      (number_correct.to_f / turns.length.to_f) * 100
  end
  def percent_correct_by_category(category)
    correct = number_correct_by_category(category)
    turns_in_category = 0
    turns.each_with_index do |turn, index|
      if turns[index].card.category == category
        turns_in_category += 1
      end
    end
    return (correct / turns_in_category) * 100

  end
end
