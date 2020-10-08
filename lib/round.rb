class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  #method 1 - access 1 element of
  #array cards, access the guess, compare, store result
  #move next card to become current card
  def current_card
    require "pry"; binding.pry
  end

  def notsurewhatname
    if card.answer == turn.guess
      true
    else
      false
    end
  end

  def take_turn
  end


  #method 2 - take_turn method - move round to next card, access the guess - create a new
  # Turn object (new_turn) that holds the card and the guess - I want
  # this method to return the new_turn value.
end
