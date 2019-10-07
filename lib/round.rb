class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    user_turn = Turn.new(guess,current_card)
    @turns << user_turn
    @deck.cards.shift
    user_turn
  end

  def number_correct
    correct_guesses = 0
    @turns.each do |turn|
      if turn.correct?
        correct_guesses += 1
      end
    end
    correct_guesses
  end

  def number_correct_per_category(category)
    number_correct_per_category = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        number_correct_per_category += 1
      end
    end
    number_correct_per_category
  end

  def percent_correct
    number_correct / @turns.count * 100
  end

  def percent_by_category(category_correct)
    total = 0
      @turns.each do |turn|
        if turn.card.category == category_correct
          total += 1
        end
      end
      total
    (number_correct(category_correct) / total * 100
  end
end
