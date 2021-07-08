class Round
  attr_reader :deck, :turns, :correct_turns, :turns_in_cat

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = []
    @turns_in_cat = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
      new_turn = Turn.new(guess, current_card)
      @turns << new_turn
      if new_turn.correct? == true
        @correct_turns << new_turn
      end
      @deck.cards.shift
      new_turn
  end

  def number_correct
    @correct_turns.length
  end

  def number_correct_by_category(cat)
    @turns_in_cat = @correct_turns.select {|turn| turn.card.category == cat}
    number_correct_by_category = @turns_in_cat.select {|turn| turn.correct? == true}.length
  end

  def percent_correct
    @correct_turns.length.to_f / @turns.length * 100
  end

  def percent_correct_by_category(cat)
    percent = (number_correct_by_category(cat) / @turns_in_cat.length).to_f * 100
    rescue ZeroDivisionError
      0
  end
end
