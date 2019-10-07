class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, @deck.cards.first)
    @turns << current_turn
    @deck.cards.shift
    current_turn
  end

  def number_correct
    correct_turns = []
    @turns.each do |turn|
      if turn.correct? == true
        correct_turns << turn
      end
      correct_turns.length
    end
  end

  def correct_by_category(corr_cat)
    total_correct_cat = 0
    @turns.select do |turn|
      if turn.correct? == true && turn.card.category == corr_cat
        total_correct_cat += 1
      end
    end
      total_correct_cat
  end
end
