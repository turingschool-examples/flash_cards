class Round
    attr_accessor :deck,
                  :turns

      def initialize(deck)
        @deck = deck
        @turns = []
      end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

# need to check the round against the guess 
  def number_correct
    default_guess == 0
    default_guess.each do |default_guess|

    end
  end

end
