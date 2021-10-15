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
    @turns << Turn.new(response.capitalize, current_card)
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
      'Not Enough Data'
    end
  end

  def percent_correct_by_category(category)
    cards_in_category = @deck.cards_in_category(category).count
    if @turns.length > 0
      number_correct = number_correct_by_category(category).to_f
      number_correct/cards_in_category*100
    else
      'Not Enough Data'
    end
  end
end
