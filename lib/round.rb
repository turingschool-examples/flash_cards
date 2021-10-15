# Richard Tillies
# October 13, 2021
# Round class
# ~/turing/1module/projects/lib/round.rb

class Round
  attr_reader :deck, :turns, :correct_cards

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_cards = []
  end

  def current_card
    @deck.cards.first()
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.shift())
    @turns << new_turn
    if new_turn.correct?
      @correct_cards << new_turn.card
    end
    new_turn
  end

  def last
    @turns.last
  end

  def number_correct
    @correct_cards.count
    # @correct_cards.length()
  end

  def number_correct_by_category(cat)
    deck = Deck.new(@correct_cards)
    correct = deck.cards_in_category(cat)
    correct.count()
  end

  def percent_correct
    number_correct * 100 / @turns.count
  end

  def percent_correct_by_category(cat)
    # number_correct_by_category(cat) * 100 / @deck.cards_in_category(cat).count
    deck = Deck.new(@correct_cards)
    number_correct_by_category(cat) * 100 / deck.cards_in_category(cat).count
    # puts number_correct_by_category(cat) * 100 / deck.cards_in_category(cat).count
    # puts number_correct_by_category(cat)
    # puts deck.cards_in_category(cat).count
  end

end
