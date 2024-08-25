class Round
  attr_reader :deck,
              :turns,
              :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(@current_card, guess)
    @turns << new_turn
    turn
    end


end