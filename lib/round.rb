class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.first)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    require 'pry'; binding.pry
  end
  # The take_turn method is the crux of this problem. 
  # The take_turn method takes a string representing the guess. 

  # It should create a new Turn object with the appropriate 
  # guess and Card. It should store this new Turn, as well as 
  # return it from the take_turn method. 

  # Also, when the take_turn method is called, the Round 
  # should move on to the next card in the deck.
end