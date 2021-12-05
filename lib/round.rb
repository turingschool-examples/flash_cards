class Round
  attr_reader :round, :turns, :current_card, :deck, :take_turn

  def initialize(deck)
    @round = round
    @deck = deck
    @turns = []
  end


    def current_card
      @deck.cards[0]
    end
    # @deck = deck



  # def current_card
  #   @deck.cards.first
  # end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
   @turns << new_turn
   @turns.last
   @deck.cards.rotate!
   # require 'pry'; binding.pry
   return new_turn
  end
  # def turns
  #
  # end
#can be done in take turn class
  def number_correct
    correct_guesses = 0
    @turns.each do |turn|
      if turn.correct?
        correct_guesses += 1
      end
    end
    return correct_guesses
  end
end
