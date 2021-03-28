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
    # deck.cards[0]
    deck.cards[turns.length]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    # current_card = deck.cards[turns.length - 1]
    # deck.cards[1]
    # I cant get this to work
    # if current_card.answer == new_turn.guess
    #   number_correct = number_correct + 1
    # end
    # def number_correct
    #   correct = 0
    #   if current_card.answer == take_turn.guess
    #   correct + 1
    #   end
    # end
    def number_correct
      number_correct = 0
      if current_card.answer == turns[turns.length - 1].guess
      number_correct + 1
      end
    end


  end
  #I know this is cheap
  # def number_correct
  #   correct = 0
  #   if current_card.answer == new_turn.guess
  #   correct + 1
  #   end
  # end

end


#
