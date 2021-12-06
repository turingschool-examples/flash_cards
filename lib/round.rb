class Round

attr_reader :deck, :turns, :current_card, :number_correct, :number_wrong,
:correct_cards, :correct_category, :turns_by_category
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
    @number_wrong = 0
    @correct_cards = []
    @correct_category = []
    @turns_by_category = []
    @counter = 0
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
    @counter +=1
    @current_card = deck.cards[@counter]
    return turns.last
  end

    def number_correct_by_category(category)
      @correct_category = []
      @turns.each do |turn|
        if turn.card.category == category && turn.correct?
        @correct_category << turn
      end
      end
      return @correct_category.count
    end

    def percent_correct
      (@number_correct.to_f / @turns.count) * 100
    end

    def turns_by_category(category)
      @turns.each do |turn|
      if turn.card.category == category
        @turns_by_category << category
      end
      end
      return @turns_by_category.count
    end

    def percent_correct_by_category(category)
      (number_correct_by_category(category).to_f / turns_by_category(category)) * 100

    end
  end
