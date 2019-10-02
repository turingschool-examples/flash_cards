class Round
  attr_accessor :deck, :turns

  def initialize(deck)
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
    @deck.cards.first
  end

  def take_turn(guess)
    # Takes a string that represents the guess
    # Creates a new Turn object with the appropriate guess and Card
    # Store the new Turn, adn return it from the take_turn method
    # the Round should move on to the next card in the deck.
  end

  def number_correct
  end

  def number_correct_by_category(category)
  end

  def percet_correct
  end

  def percent_correct_by_category(category)
  end
  

end
