class Round

attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, @deck.cards.first)
    @turns << turn
    @deck.cards.rotate!
    turn
  end

  def number_correct
    @turns.select {|turn| turn.correct?}.count
  end

  def number_correct_by_category(category)
    @deck.cards.count {|card| card.category && == category}
  end

end
