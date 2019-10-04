require './lib/card'
require './lib/turn'
require './lib/round'

class Round
  attr_reader :deck
  attr_accessor :turns, :turn, :correct_guess_counter, :turn_number
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_guess_counter = 0


  end

  def current_card
    @deck.cards.shift
  end


  def take_turn(guess)
    @turn = Turn.new(guess, current_card)

    if guess == current_card.answer
        @correct_guess_counter += 1
    end
    @turns << @turn
    #@turns.last
    @correct_guess_counter
    @turns.last.feedback
  end

   def round_count
     @turn_number = @turns.count + 1
   end

  def correct_guess_count
    @correct_guess_counter
  end

end
