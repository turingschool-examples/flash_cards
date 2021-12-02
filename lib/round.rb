class Round
  attr_reader :turns, :deck, :cards, :card_counter, :number_correct, :answer, :stats_hash
  def initialize(deck)
    @deck = deck
    @turns = []
    @card_counter = 0
    @number_correct = 0
    @stats_hash = Hash.new {|h,k| h[k] = []}
  end


  def current_card
      self.deck.cards[@card_counter]
  end


  def take_turn(guess)
    @turns.push Turn.new(guess, current_card)
    return @turns.last
  end

  def correct?
    if self.turns.last.guess == self.turns.last.card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      @number_correct += 1
      @stats_hash[self.turns.last.card.category.to_sym] << true
      @card_counter += 1
      return "Correct, the answer is #{self.turns.last.card.answer}"
    else
      @stats_hash[self.turns.last.card.category.to_sym] << false
      @card_counter += 1
      return "Incorrect, the correct answer is #{self.turns.last.card.answer}"
    end
  end

  def number_correct_by_category(category)
    @stats_hash[category].count(true)
  end

  def percent_correct
    messy = @number_correct.to_f / @card_counter
    rounded = messy.floor(4) * 100
  end

  def percent_correct_by_category(category)
    messy = number_correct_by_category(category).to_f / @stats_hash[category].length
    rounded = messy.floor(4) * 100
  end

end
