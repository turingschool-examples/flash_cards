class Round
  attr_reader :deck, :turns, :number_correct, :correct_turns, :used_cards

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0 #instance variable necessary?
    @correct_turns = []
    @used_cards = []#will be redundant if fixed
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @number_correct += 1 if turn.correct?
    @deck.cards.shift #is destructive, may need to change if need to loop deck later
    @correct_turns << turn.card if turn.correct? #source of all of my earlier hardships. Fixing now will break round.
    @used_cards << turn.card #may not be needed with @correct_turns fix
    turn
  end

  def number_correct_by_category(type)
    Deck.new(@correct_turns).cards_in_category(type).length
  end

  def percent_correct
    @number_correct *100 / turns.length
  end

  def percent_correct_by_category(type)
    type_turns = @used_cards.find_all {|card| card.category == type}
    number_correct_by_category(type) * 100 / type_turns.length
  end
end
