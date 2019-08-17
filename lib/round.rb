#  Round will be the object that processes responses and records guesses. A Round is initialized with a Deck. The idea is that when we start a Round, the current card is the first in the deck (the first in the Deck’s array of Cards). When we make a guess, the guess is recorded, and the next card in the deck becomes the current card.

# The take_turn method is the crux of this problem. The take_turn method takes a string representing the guess. It should create a new Turn object with the appropriate guess and Card. It should store this new Turn, as well as return it from the take_turn method. Also, when the take_turn method is called, the Round should move on to the next card in the deck.
require 'pry'

class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
     @deck.cards[0]
  end

  def take_turn(guess)
  # Create new Turn object with guess and card. It should store this new Turn, as well as return it from the take_turn method.
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
  # Also, when the take_turn method is called, the Round should move on to the next card in the deck.
     @deck.cards.shift
     @deck.cards[0]
     new_turn
  end



  # HERE IS WHERE I STOPPED FOR THE NIGHT BUT THE METHOD DOEST WORK...
  # def number_correct
  #   # if my guess from the take_turn matches the
  #   # if @round.take_turn(guess) == @deck.current_card.answer
  #     @number_correct += 1
  #   end
  # end

  # def number_correct_by_category(category_string)
  #
  # end

end
