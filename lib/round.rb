require_relative 'deck.rb'
require_relative 'turn.rb'


class Round

  attr_accessor :deck, :turns, :current_card, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    if turn.guess == @current_card.answer
      @number_correct += 1
    end
    @deck.cards.shift
    @current_card = @deck.cards[0]
    turn
  end

end
