require './lib/card'
require './lib/turn'
require './lib/deck'



class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    if @turns == []
      @turns << deck.cards[0]
      return deck.cards[0]
    elsif @turns == [deck.cards[0]]
      @turns << deck.cards[1]
      return deck.cards[1]
    elsif @turns == [deck.cards[0], deck.cards[1]]
      @turns << deck.cards[2]
      return deck.cards[2]
    else
    end
  end


  def take_turn(guess)
    if @turns == []
      turn = Turn.new(guess, deck.cards[0])
    elsif @turns == [0]
      turn = Turn.new(guess, deck.cards[1])
    elsif @turns == [0, 1]
      turn = Turn.new(guess, deck.cards[2])
    elsif @turns == [0, 1, 2]
    end
  end
  #   #create new turn object
  #   #store turn object
  #   #add to @turns counter
  #   #return turn object
  #   turn.correct?
  #   @turns << turn
  #   #return turn?
end
