class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_wrong = 0
  end

  def current_card
    @current_card = deck.cards[0]
  end

  def take_turn(guess)
    @turns = Turn.new(guess, current_card)

    if turns.correct?
      @number_correct += 1
    end
    @current_card = @deck.cards.rotate(1)
    @turns


  end

  def turns
    @turns
  end

  def number_correct

    @number_correct
  end


  # def number_wrong
  #   @current_card << @current_card.shift
  #   @number_wrong
  # end


end
