class Round
  attr_accessor :deck, :turns, :player_guess

  def initialize(deck)
    @deck = deck
    @turns = []
    @player_guess = player_guess
  end
# I don't need this w/ my accessor
  def deck
    @deck
  end
# I don't need this w/ my accessory
  def turns
    @turns
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(player_guess)
    # Takes a string that represents the guess
    player_guess = @player_guess

    # Creates a new Turn object with the appropriate guess and Card
    card = round.current_card
    guess = @player_guess
    new_turn = Turn.new(guess, card)

    # Store the new Turn, adn return it from the take_turn method
    @turns << new_turn
    new_turn
    # the Round should move on to the next card in the deck.
    played_cards = []
    played_cards << round.deck.cards.shift

    round.current_card

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
