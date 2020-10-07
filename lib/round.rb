class Round
  attr_reader :deck,
              :turns,
              :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
  end

  # def current_card
  #   @deck.cards[0]
  # end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    # require 'pry'; binding.pry
    @deck.cards.rotate
    new_turn
  end
end