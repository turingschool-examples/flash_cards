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
    current_turn = Turn.new(guess, @deck.cards.first)
    @turns << current_turn
    @deck.cards.shift
    current_turn
  end

  def number_correct
    num_correct = 0
    @turns.select do |turn|
      if turn.correct? == true
        num_correct += 1
      end
    end
    num_correct
  end

  def correct_by_category(corr_cat)
    total_correct_cat = 0
    @turns.select do |turn|
      if turn.correct? == true && turn.card.category == corr_cat
        total_correct_cat += 1
      end
    end
      total_correct_cat
  end

  def percent_correct
    ((number_correct.to_f / @turns.length) * 100).round
  end

  def percent_correct_by_category(category)
    total_cat = 0
    @turns.select do |turn|
      if category == turn.card.category
        total_cat += 1
      end
    end
    (correct_by_category(category).to_f / total_cat) * 100
  end
end
