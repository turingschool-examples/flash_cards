require './lib/deck'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first # keep it first. through method 'take turn' shift the array positions so the appropriate card is on top
  end

  #def take_turn(user_guess)
    #p @deck.
  def turns
    @deck.cards.rotate
  end

  def take_turn(user_guess)
    #supposed to return a turn object, and in that turn object, should have current card
    new_turn = Turn.new(user_guess, current_card)


  end

end
