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
    if @card_counter == -1
      self.deck.cards[0]
    else
      self.deck.cards[@card_counter]
    end
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

  def percent_correct
    messy = @number_correct.to_f / (@card_counter + 1)
    rounded = messy.floor(4) * 100
  end

  def percent_correct_by_category(category)
    messy = number_correct_by_category(category).to_f / @stats_hash[category].length
    rounded = messy.floor(4) * 100
  end

end
