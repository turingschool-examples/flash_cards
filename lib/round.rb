class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.shift
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns.push(new_turn)
    new_turn
  end

  def number_correct
    correct_guess = 0
    turns.each do |turn|
       if turn.feedback == "Correct!"
        correct_guess += 1
       end
    end
    correct_guess
  end

  def number_correct_by_category(category)
    correct_guess_by_category = 0
    turns.each do |turn|
      if turn.feedback == "Correct!" && turn.card.category == category
        correct_guess_by_category += 1
      end
    end
    correct_guess_by_category
  end

  def percent_correct
    (number_correct.to_f / turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / number_correct.to_f) * 100
  end

end
