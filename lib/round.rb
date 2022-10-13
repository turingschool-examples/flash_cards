class Round

  attr_reader         :card,
                      :deck,
                      :turns


  def initialize(deck)
   @deck             = deck
   @turns            = []
   @current_card     = 0
   @number_correct   = 0
   @number_guesses   = 0
  end


  def current_card
    deck.cards[@current_card]
  end

  def turns (turn)
    @new_turn = Turn.new(guess, current_card)
    @turns << @new_turn
    @new_turn
  end

  def take_turn
    @new_turn.correct? @number_correct += 1
    deck.cards << deck.cards[@current_card] && @total_cards += 1
    @current_card    += 1
    @number_guesses  += 1
  end

end
