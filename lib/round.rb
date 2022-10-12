class Round
  attr_reader :deck, :turns, :number_correct
  # , :current_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    # @current_turn = nil
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, @deck.cards[0])
    if guess == @deck.cards[0].answer
      @number_correct += 1
    end
    @deck.cards.shift
    @turns << current_turn

    return current_turn
  end


end

# require "pry"; binding.pry
