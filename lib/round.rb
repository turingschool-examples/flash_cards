require './lib/deck'

class Round
  attr_accessor :deck, :turns, :count

  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 0
  end

  def current_card
    @deck.cards[@count - @deck.cards.length]
  end


  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @count += 1
    @turns[-1]
  end

  def number_correct
    @turns.select do |turn|
      turn.correct?
    end.size
  end

  def number_correct_by_category(category)
    @turns.select do |turn|                #look at array of turn objects and select these
      (turn.guess == turn.card.answer) && (turn.card.category == category)
    end.size                               #output array of turns that are correct AND category matches arg, return size
  end

  def percent_correct
    (number_correct.to_f / count.to_f) * 100
  end

  def percent_correct_by_category(category)
    cardspercategory = @turns.select do |turn|
      turn.card.category == category
    end.size
    (number_correct_by_category(category).to_f / cardspercategory.to_f) * 100
  end
end
