require 'pry'

class Round

  attr_reader:card, :deck, :turns


  def initialize(deck)
    @deck = deck
    @turns = []

    @current_card = 0
  end
  def current_card
    deck.cards[@current_card]
  end
  def take_turn
    @turn = Turn.new(guess, current_card)

    @turns << @new_turn
    @new_turn
  end


end
