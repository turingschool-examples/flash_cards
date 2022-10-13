class Round

  attr_reader         :card,
                      :guesses,
                      :deck,
                      :number_correct,
                      :total_cards,
                      :number_guesses

def initialize(deck)
  @deck             = deck
  @guesses          = []
  @current_card     = 0
  @number_correct   = 0.0
  @number_guesses   = 0.0
  @total_cards      = deck.cards.count
  @current_guess    = 0
  @percent_correct  = percent_correct
end
