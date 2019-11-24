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
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    # @turns.find_all do |t|
    #   t.correct?
    #   require "pry"; binding.pry
    # end.count
    count = 0
    @turns.each do |t|
      if t.correct?
        count += 1
      end
    end
    count
  end

  def number_correct_by_category(category)
    @grouped = @turns.group_by {|t| t.card.category}
    @grouped[category].find_all do |turn|
      turn.correct?
    end.count
  end

  def percent_correct
    (number_correct * 100).to_f / @turns.count
  end

  def percent_correct_by_category(category)
    # require "pry"; binding.pry
    (number_correct_by_category(category) * 100).to_f / @grouped[category].count
  end
end
