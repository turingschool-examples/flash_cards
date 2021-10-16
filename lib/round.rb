class Round
  attr_accessor :deck, :turns, :store_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @store_correct = []
    # @number_of_cards = deck.length
    # @current_card = current_card
    # @counter = 0
    # @number_correct = @counter
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    #takes a string as a guess
    #create a new Turn object with aprropriate guess and Card
    #store turn
    #return turn
    #move Round to next card in the deck
      turn = Turn.new(guess, current_card)
          turns << turn
      if turn.correct?
        store_correct << guess
      end
      deck.cards.shift
    return turn
  end

  def number_correct
    store_correct.length
  end

end

    # def number_correct
    #   if @guess.correct?
    #     @correct_guesses += 1
    #   end
    # end
