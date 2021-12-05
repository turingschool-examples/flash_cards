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
    x = Turn.new(guess, current_card)
    @turns << x
    if x.correct?
      @number_correct += 1
      @correct_cards << x
    else
      @number_wrong += 1
    end
    @current_card = deck.cards[+1]
    return turns.last
    end

    def number_correct_by_category
      @correct_category = []
      @turns.each do |turn|
        if turn.card.category == category && turn.correct?
        @correct_category << turn
      end
      end
      return correct_category.count
      end
  end
