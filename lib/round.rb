class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_wrong = 0

  end

  def current_card
    @current_card = @deck.cards[0]
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns = Turn.new(guess, current_card)

    # if @current_card.answer == turn.guess
    #   @number_correct += 1
    # else
    #   @number_wrong += 1
    # end
    #deck.insert(2, deck.delete_at(1))
  end

  def turns
    @turns
  end
  #binding.pry


end
