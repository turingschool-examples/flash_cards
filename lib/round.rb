class Round
  attr_reader :turns,
              :deck,
              :take_turn,
              :new_turn


  def initialize(deck)
    @deck = deck
    @turns = []


  end

  def current_card
    deck.cards[0]
  end





  def take_turn(guess)
    @guess = guess
    # new_turn = Turn.new(guess, current_card)

  end

end


#
