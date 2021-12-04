class Round
  attr_reader :round, :turns, :current_card, :deck, :take_turn

  def initialize(deck)
    @round = round
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    # @deck = deck
    #require 'pry'; binding.pry
  end


  # def current_card
  #   @deck.cards.first
  # end

  def take_turn(guess)
    x = Turn.new(guess, current_card)
   @turns << x
   @turns.last
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
