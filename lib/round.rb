class Round
  attr_reader :turns,
              :deck,
              :take_turn,
              :new_turn
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []


  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    deck.cards[turns.length - 1]
    # deck.cards[1]
    # I cant get this to work
    # if current_card.answer == new_turn.guess
    #   number_correct = number_correct + 1
    # end



  end
  #I know this is cheap
  def number_correct
    1

  end

end


#
