class Round

  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_cards = []
  end

  def current_card
    deck.cards[turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @number_correct += 1
      @correct_cards << turn.card
    end
    turn
  end
  # Do not need this method since it is also defined above in reader
  def number_correct
    @number_correct
  end

  def number_correct_by_category(category)
    category_correct = []
      @correct_cards.each do |correct_card|
        if correct_card.category == category
          category_correct << correct_card.category
        end
    end
    category_correct.count
  end

  def percent_correct
    (@correct_cards.count.to_f / @turns.count.to_f) * 100
  end


end
