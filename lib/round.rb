class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    correct = 0
    @turns.map do |turn|
      if turn.card.answer == turn.guess
        correct += 1
      end
    end
    correct
  end

  def number_correct_by_category(category)
    correct_turns = []
    @turns.each do |turn|
      if turn.card.answer == turn.guess
        correct_turns << turn
      end
    end
    correct_by_category = []
    correct_turns.each do |turn|
      if turn.card.category == category
        correct_by_category << turn
      end
    end
    correct_by_category.count
  end

  
end


# require 'pry'; binding.pry
