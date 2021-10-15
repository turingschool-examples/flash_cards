class Round
  attr_reader :deck, :turns, :turn_num

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_num = 1
  end

  def current_card
      @deck.cards[@turns.length]
  end

  def take_turn(response)
    @turns << Turn.new(response, current_card)
    @turn_num += 1
    @turns.last
  end

  def number_correct
    @turns.count do |trivia|
      trivia.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |trivia|
        trivia.card.category == category && trivia.correct?
    end
  end

  def percent_correct
    if @turns.length > 0
      (number_correct.to_f/@turns.length) * 100
    else
      'No guesses taken'
    end
  end

  def percent_correct_by_category(category)
    if @turns.length > 0
      (number_correct_by_category(category).to_f/@turns.count {|trivia| trivia.card.category == category}) * 100
    else
      'No guesses taken'
    end
  end
end
