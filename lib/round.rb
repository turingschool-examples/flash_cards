class Round
  attr_reader :turns, :deck, :cards, :card_counter, :number_correct, :answer, :stats_hash
  def initialize(deck)
    @deck = deck
    @turns = []
    @card_counter = -1
    @number_correct = 0
    @stats_hash = Hash.new {|h,k| h[k] = []}
  end


  def current_card
    self.deck.cards[@card_counter]
  end


  def take_turn(guess)
    @card_counter += 1
    @turns.push Turn.new(guess, current_card)
    return @turns.last
  end

  def correct?
    if self.turns.last.guess == self.turns.last.card.answer
      @number_correct += 1
      @stats_hash[self.turns.last.card.category.to_sym] << true
      true
    else
      @stats_hash[self.turns.last.card.category.to_sym] << false
      false
    end
  end

  def feedback
    if correct? == true
      "Correct, the answer is #{self.turns.last.card.answer}"
    else
      "Incorrect, the correct answer is #{self.turns.last.card.answer}"
    end
  end

  def number_correct_by_category(category)
    @stats_hash[category].count(true)
  end

end
