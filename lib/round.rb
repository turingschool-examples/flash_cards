class Round
  attr_reader :deck, :turns, :number_correct, :correct_turns, :used_cards

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0 #instance variable necessary?
    @correct_turns = []
    @used_cards = []
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

  def first_card_category
    @used_cards.shift.category
  end

  def all_categories
    num_cards = @used_cards.length
    card_categories = []
    num_cards.times {card_categories << first_card_category} #may be able to do this differently with map
    card_categories
  end

  def used_categories
    all_categories.uniq
  end



end
