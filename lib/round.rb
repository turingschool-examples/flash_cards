class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card #refactor me into cards!!
    deck.cards.first
  end

  def take_turn(guess)
    nturn = Turn.new(guess, current_card)
    @turns.push(nturn)
    deck.cards.rotate!
    nturn
  end

  def number_correct
    result = []
    @turns.each do |turn|
      if turn.guess == turn.card.answer #refactor this turn.correct?
        result.push(turn.card)
      end
    end
    result.count
  end

  def number_correct_by_category(category)

  #   def number_correct_by_category(category)
  #     @turns.find_all do |turn|
  #       turn.card.category == category && turn.card.answer == turn.guess #want to refactor this
  #      end.length
  #   end
    results = []
    @turns.each do |turn|
      if turn.correct? == true
        results.push(turn)
      end
    end
    separated = []
    results.each do |result1|
      if result1.card.category == category
        separated.push(result1)
      end
    end
    separated.count
  end

  def percent_correct
    (number_correct.to_f/turns.count)*100
  end

  def percent_correct_by_category(category)
    result = []
    @turns.each do |turn|
      if turn.card.category == category && turn.correct? == true
      result.push(turn)
      end
    end
    (result.count.to_f)*100
  end

  def start
    
  end
end
