class Round
  attr_reader :deck, :turns#, :round

  def initialize(deck)
    @deck = deck
    @turns = []
    # @round = 0
  end

  def current_card
      @deck.cards[@turns.length]
  end

  def take_turn(response)
    # this_turn = Turn.new(response, current_card)
    # @turns << this_turn
    # this_turn
    @turns << Turn.new(response, current_card)
    @turns.last
  end

  def number_correct
    @turns.count do |trivia|
      trivia.correct?
    end
  end

  def number_correct_by_category(category)
    # method will need to reference the turn.correct?
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
    #add content: need number correct by category divided by the number of turns with that category
    if @turns.length > 0
      (number_correct_by_category(category).to_f/@turns.count {|trivia| trivia.card.category == category}) * 100
    else
      'No guesses taken'
    end
  end
end
