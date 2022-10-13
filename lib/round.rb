class Round

  attr_reader         :card,
                      :turns,
                      :deck,
                      :number_correct,
                      :total_cards,
                      :number_guesses

 def initialize(deck)
  @deck             = deck
  @turns            = []
  @current_card     = 0
  # @number_correct   = 0.0
  # @number_guesses   = 0.0
  # @total_cards      = deck.cards.count
  # @current_guess    = 0
 end

 def current_card
    deck.cards[@current_card]
  end

 def record_turn(turn)
    @new_turn = Turn.new(guess, current_card)
    @turns << @new_turn
    @new_turn
  end

end
