class Round
  attr_reader :deck, :turns, :correct_cards, :incorrect_cards
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, self.current_card)
    @deck.cards.shift
    @turns[-1]
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    (self.number_correct.to_f/self.turns.length) * 100.0
  end

  def percent_correct_by_category(category)
    category_array = []
    @turns.each { |turn| category_array << turn if turn.card.category == category }
    (self.number_correct_by_category(category).to_f/category_array.length) * 100.0
  end

end
