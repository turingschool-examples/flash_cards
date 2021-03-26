class Round
  attr_accessor   :deck,
                  :turns,
                  :correct_answer

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_answer = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards = @deck.cards.rotate
    new_turn
  end

  def number_correct
    correct_turn = []
    @turns.each do |turn|
      if turn.card.answer == turn.guess
        correct_turn << turn
      end
    end
    correct_turn.count
  end

  def number_correct_by_category(category)
    new_set = []

    @turns.each do |set|
      if set.card.answer == set.guess
        new_set << set
      end
    end

    correct_set = new_set.find_all do |turn|
      turn.card.category == category
    end
    correct_set.count
  end

  def percent_correct
    (number_correct.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(category)
    new_set = []

    @turns.each do |set|
      if set.card.answer == set.guess
        new_set << set
      end
    end

    correct_set = new_set.find_all do |turn|
      turn.card.category == category
    end

    (number_correct_by_category(category).to_f / correct_set.count) * 100
  end

end
