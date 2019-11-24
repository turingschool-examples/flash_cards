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
  #def turns
  #  @deck.cards.rotate # have to shift this. 1st turns returns empty array above
    # 2nd turns need to return instance of turn object in that array. array doesn't change
    # but the take_turn method is supposed to insert/shovel a Turn object into the array.
#  end

  def take_turn(user_guess)
    #supposed to return a turn object, and in that turn object, should have current card
    new_turn = Turn.new(user_guess, current_card)
    @turns << new_turn
    new_turn

  end

end
