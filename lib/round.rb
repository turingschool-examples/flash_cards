
class Round

attr_reader :deck, :current_card, :turns


  def initialize(deck)
    @deck = deck
    @card_index = 0
    @turns = []
    @current_card = @deck.cards[@card_index]
  end


  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns.push(new_turn)
    if (@card_index < @deck.cards.length)
      @card_index += 1
    end
    @current_card = @deck.cards[@card_index]
    new_turn
  end


  def number_correct()
    correct_count = 0

    @turns.each do |turn|
      if (turn.correct?)
        correct_count += 1
      end
    end
      return correct_count
  end


  def number_correct_by_category(category)
    correct_count = 0
    @turns.each do |turn|
      if (turn.correct? && turn.card.category == category)
        correct_count += 1
      end
    end
      return correct_count
  end


  def percent_correct()
    return ((self.number_correct().to_f / @turns.count) * 100.0)
  end


  def percent_correct_by_category(category)
    categorized_turns = []

    @turns.each do |turn|
      if (turn.card.category == category)
        categorized_turns.push(turn)
      end
    end
    self.number_correct_by_category(category).to_f / categorized_turns.length * 100.0
  end

end
