class Round
  attr_reader :deck, :turns, :number_correct, :correct_turns, :used_cards

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_turns = []
    @used_cards = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess) #I know this whole method is a mess, probably could've done it with half the contents, but I missed using @turns, it kinda ballooned, and fixing now would break everything else.
    turn = Turn.new(guess, current_card)
    @turns << turn
    @number_correct += 1 if turn.correct?
    @deck.cards.shift  #is destructive, keep in mind if need to cycle deck
    @correct_turns << turn.card if turn.correct?
    @used_cards << turn.card
    turn
  end

  def number_correct_by_category(type)
    Deck.new(@correct_turns).cards_in_category(type).length
  end

  def percent_correct
    @number_correct * 100 / @used_cards.length
  end

  def percent_correct_by_category(type)
    type_turns = @used_cards.find_all {|card| card.category == type}
    number_correct_by_category(type) * 100 / type_turns.length
  end

  def first_card_category
    cards = @turns
    cards.shift.card.category
  end

  def all_categories
    num_cards = turns.length
    card_categories = []
    num_cards.times {card_categories << first_card_category} #may be able to do this differently with map
    card_categories
  end

  def used_categories
    all_categories.uniq
  end



end
