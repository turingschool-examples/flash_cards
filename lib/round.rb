
class Round

  attr_reader :deck, :turns, :current_card #:number_correct #:card_cards

  def initialize (deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]

    #@number_correct = 0 --> do not need if using method to determine correct in turn array

    #@correct_cards = [] --> do not need if using a method to count correct in turn array.
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    # if new_turn.correct?
    #   @number_correct += 1
    # end

    @deck.cards.shift
    # ! returns the same array, bang focus thing to happens on that original thing
    @current_card = @deck.cards[0]

    new_turn
    # did not need return key word
  end

end
