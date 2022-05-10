class Round

  attr_reader :deck,
              :used_cards,
              :turns,
              :number_correct

  def initialize(deck)
    @deck = deck
    @used_cards = []
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards.first)
    @number_correct += 1 if @turns.last.guess == @deck.cards.first.answer
    @used_cards << @deck.cards.first
    @deck.cards.shift
    return @turns.last
  end

  def number_correct_by_category(cat)
    number_correct_by_category = 0
    @turns.each do |t|
      if t.card.category == cat && t.correct?
        number_correct_by_category += 1
      end
    end
    return number_correct_by_category
  end

  def percent_correct
    @number_correct.to_f * 100 / @turns.count
  end

  def percent_correct_by_category(cat)
    self.number_correct_by_category(cat) * 100 / @turns.count do |t|
      t.card.category == cat
    end
  end

end
