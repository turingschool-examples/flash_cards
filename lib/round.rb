class Round
  attr_reader :deck, :turns, :number_correct, :category_count_correct, :category_total_count

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @category_total_count = {Geography: 0, STEM: 0, "Pop Culture" => 0}
    @category_count_correct = {Geography: 0, STEM: 0, "Pop Culture" => 0}
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turns << Turn.new(guess, current_card)
    category_total_count[current_card.category] += 1
    if turns.last.correct?
      @number_correct += 1
      category_count_correct[current_card.category] += 1
    end
    deck.cards.shift
    turns.last
  end

  def number_correct_by_category(category)
    category_count_correct[category]
  end

  def percent_correct
    (number_correct.to_f / turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    (category_count_correct[category].to_f / category_total_count[category].to_f) * 100
  end


end
