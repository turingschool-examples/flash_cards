class Round
  attr_reader :deck, :turns, :correct_answers

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_answers = 0
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    # a turn is initialized with a guess and a card
    temp1 = Turn.new(guess, current_card)
    # check if guess is correct, then update temp1.correct_guess
    temp1.correct?
    @turns << temp1
    # remove the current card from the deck
    @deck.cards.shift
    temp1
  end

  def number_correct
    ticker = 0
    @turns.map do |turn|
      if turn.correct_guess
      ticker += 1
      end
    end
    ticker
  end

  def number_correct_by_category(category)
    ticker = 0
    @turns.map do |turn|
      if turn.correct_guess && turn.card.category == category
        ticker += 1
      end
    end
    ticker
  end

  def percent_correct
    (100 * (number_correct.to_f / @turns.count.to_f))
  end

  def number_category(category)
    ticker = 0
    @turns.each do |turn|
      if turn.card.category == category
        ticker += 1
      end
    end
    ticker
  end

  def percent_correct_by_category(category)
    (100 * (number_correct_by_category(category).to_f / number_category(category).to_f))
  end
end
