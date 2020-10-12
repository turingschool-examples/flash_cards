class Round
  attr_reader :deck, :turns, :turn_number
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_number = 1
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @turn_number += 1
    deck.cards.shift
    turns.last
  end

  def number_correct
    amount_correct = 0
    @turns.each do |turn|
      if turn.correct?
        amount_correct += 1
      end
    end
    amount_correct
  end

  def number_correct_by_category(category)
    amount_correct = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        amount_correct += 1
      end
    end
    amount_correct
  end

  def percent_correct
    #total guesses = 5
    #total correct guesses = 3
    #correct / total = 0.6 * 100
    total_guesses = @turns.count
    correct_guesses = number_correct
    correct_guesses.to_f / total_guesses * 100
  end

  def percent_correct_by_category(category)
    #total guesses = 5
    #total guesses in category = 2
    #total correct guesses = 3
    #total correct in category = 2
    #correct / total = 0.6 * 100
    #2 / 2 = 1.0 * 100
    total_correct_in_category = number_correct_by_category(category)
    guesses_in_category = 0
    @turns.each do |turn|
      if turn.card.category == category
        guesses_in_category += 1
      end
    end
    total_correct_in_category.to_f / guesses_in_category * 100
  end
end
