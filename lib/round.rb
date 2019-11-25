# NOTE: plug in actual values instead of variables to get to run, then go find that exact variable

class Round
  attr_reader :deck, :cards, :category, :guess, :card, :new_turn
  attr_accessor :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    # @new_turn = new_turn
    @number_correct = 0
    @card_counter = 0 #<-- regulate with each or @cards.length?
  end

  def current_card
    deck.cards[@card_counter]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    # require "pry"; binding.pry
    # if current_card.answer == guess
    if new_turn.correct? == true
      @number_correct += 1
    # else
      # @number_incorrect += 1
    end
    @turns << new_turn
    # require "pry"; binding.pry
    # @card_counter += 1
  end

  # def turns
  #   @turns << @new_turn
  # end
  
end
