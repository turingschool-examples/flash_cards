class Round
  attr_accessor :turns, :deck
  def initialize (deck)
    @turns = []
    @deck = deck
    @correct_categories = []
    end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @correct_categories << turn.card.category
    end
    @deck.cards.rotate!(1)
    turn
  end

  def number_correct
    @correct_categories.length
  end

  def number_correct_by_category(category)

    category_count = 0

    @correct_categories.each do |cat|
      if cat == category
        category_count += 1
      end
    end

    category_count
  end

  def percent_correct
    percent_correct = 0
    percent_correct = number_correct.to_f / @turns.length.to_f
    percent_correct * 100
  end

  def percent_correct_by_category(category)
    percent_correct = 0
    percent_correct = number_correct_by_category(category).to_f / deck.cards_in_category(category).count.to_f
    percent_correct * 100
  end
end
