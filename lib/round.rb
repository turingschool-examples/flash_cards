class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    @turns.last
  end

  def number_correct
    @turns.count do |turn|
      # require'pry';binding.pry
      turn.correct? == true
    end
  end

  def percent_correct
    result = (number_correct / @turns.count.to_f) * 100
  end

  def correct_turns
    find = @turns.find_all do |turn|
      turn.correct? == true
    end
  end

  def number_correct_by_category(category)
    correct_turns.count do |turn|
      turn.card.category == (category)
    end
  end

  def turns_by_category(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    result = (number_correct_by_category(category) / turns_by_category(category).to_f) * 100
  end
end
