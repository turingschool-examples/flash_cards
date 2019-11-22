class Round

  attr_reader :deck, :round, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_card = current_card



    # @turns.shift

    @my_turn = Turn.new(guess, new_card)

    @turns << @my_turn
    # require "pry"; binding.pry
    @deck.cards.shift

    @my_turn
  end

  def correct?
    if @my_turn.guess == new_card.answer
      true
    end
  end

end
