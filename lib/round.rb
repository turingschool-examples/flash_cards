# Richard Tillies
# October 13, 2021
# Round class
# ~/turing/1module/projects/flash_cards/lib/round.rb

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
    my_deck = Deck.new(@correct_cards)
    correct = my_deck.cards_in_category(cat)
    correct.count()
  end

  def percent_correct
    if @turns.count > 0
      # number_correct * 100 / @turns.count
      number_correct.to_f * 100 / @turns.count
    else
      0
    end
  end

  def percent_correct_by_category(cat)
    correct = number_correct_by_category(cat)

    spent = []
    @turns.each do |turn|
      spent << turn.card
    end

    old = Deck.new(spent)
    total = old.cards_in_category(cat).count

    if total > 0
      number_correct_by_category(cat) * 100.0 / total
    else
      0
    end
  end
end
