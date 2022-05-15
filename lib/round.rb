require './lib/turn'
class Round
  attr_reader :deck, :turns, :new_turn, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards[0]
  end


  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    turns << @new_turn
    if current_card.answer == guess
      add_correct
    end
    # require 'pry' ; binding.pry
    new_turn
  end

  def add_correct
    @number_correct =+ 1
  end

end
