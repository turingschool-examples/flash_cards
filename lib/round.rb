require './lib/turn'

class Round
  attr_reader :deck, :turns
  
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, current_card)
    @turns << current_turn
    @deck.cards.shift
    return current_turn
  end

  def number_correct
    correct_answers = 0.0

    @turns.each do |turn|
      if turn.correct? == true
      correct_answers += 1
      end
    end

    return correct_answers
  end

  def number_correct_by_category(category)
    correct_answers = 0.0

    @turns.each do |turn|
      if turn.correct? == true && turn.card.category == category
        correct_answers += 1
      end
    end

    return correct_answers
  end

  def percent_correct
    number_correct / @turns.length * 100
  end

  def percent_correct_by_category(category)
    number_in_category = 0

    @turns.each do |turn|
      if turn.card.category == category
        number_in_category += 1
      end
    end

    number_correct_by_category(category) / number_in_category * 100
  end
end
