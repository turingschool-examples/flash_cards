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
    @turns.count{|turn| turn.card.category == category && turn.correct?}
  end

  def percent_correct
     (number_correct.to_f/ @turns.count)*100
  end

end
