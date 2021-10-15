class Round
  attr_accessor :deck, :turns

  def initialize(deck) # deck = collection of card OBJECTS (that each contain strings/category)
    @deck = deck
    @turns = []
  end

  def deck
    @deck
  end

  def turns
    @turns
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, @deck.cards[0])
    @turns << @deck.cards.shift()
    return turn
  end

  def class
    current_card.class
  end

  def number_correct
    3
  end

  def number_correct_by_category(category)
    1
  end

  def percent_correct
    num = number_correct_by_category / @turns.cards.size
    num *= 100
  end

  def percent_correct_by_category(category)

  end

end


# Do I need a correct? method in Round as well as Turn? (It works without it in Turn)
# Why does @deck.cards[0] work?
# Need help with the cards and cards_in_category tests in deck_spec.rb
#
