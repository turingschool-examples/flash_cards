require "pry"

class Round
  attr_accessor :deck,
              :current_card,
              :number_correct,
              :guesses


  def initialize(deck)
    @deck = deck
    @current_card = 0
    @total_cards = 4
    @guesses = []
    @number_correct
    @turns = []
  end

  def take_turn(guess)
  turns << Turn.new(guess, @current_card)
  return
  @current_card +=1
  end

  def save_guess
    @new_guess
  end

  def turns
    @turns
  end

  def next_card(guess)
    if @new_guess.correct?
      @guesses << @new_guess
    end
  end

  def current_card
    deck.cards[@current_card]
  end

end
