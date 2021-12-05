class Round

attr_reader :deck, :turns, :current_card, :number_correct, :number_wrong
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
    @number_wrong = 0
    @correct_cards = []

  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @number_correct += 1
      @correct_cards << turn
    else
      @number_wrong += 1
    end
    @current_card = deck.cards[+1]
    return turn
    end

    # def number_correct_by_category
  end
