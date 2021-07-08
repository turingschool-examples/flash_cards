class Round
  attr_reader :deck, :turns, :number_correct, :category_count

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @category_count = {Geography: 0, STEM: 0, "Pop Culture" => 0}
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turns << Turn.new(guess, current_card)
    if turns.last.correct?
      @number_correct += 1
      @category_count[current_card.category] += 1
    end
    deck.cards.shift
    turns.last
  end

  def number_correct_by_category(category)
    @category_count[category]
  end

end
