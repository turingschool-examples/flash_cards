class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck =  deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate!
    @turns.last
  end

  def number_correct
    correct_guesses = 0
    @turns.each do |turn|
      if turn.card.answer == turn.guess
        correct_guesses += 1
      else
        correct_guesses
      end
    end
    correct_guesses
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.answer == turn.guess && turn.card.category == category
    end.length
    # correct_turns_array = @turns.map do |turn|
    #   turn.card.answer == turn.guess
    # end
    # same_category = correct_turns_array.find_all do |correct_turn|
    #   correct_turn == true
    # end
    # same_category.length
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    turns_with_category = @turns.find_all do |turn|
      turn.card.category == category
    end
    (number_correct_by_category(category).to_f / turns_with_category.length.to_f) * 100
  end

  def current_card
    @deck.cards[0]
  end
end
