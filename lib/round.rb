class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.length]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns.push(turn)
    #@deck.cards.shift
    turn
  end

  def number_correct
    count = 0
    @turns.each do |turn|
      if turn.correct?
        count += 1
      end
    end
    count
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end.length
  end

  def percent_correct
    # May not need 'self.'
    ((self.number_correct * 100.0) / @turns.count).round(1)
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category) * 100.0) / cards_in_category(category)).round(1)
    #   NoMethodError: undefined method `cards_in_category' for #<Round:0x0000000130a8d7d0>
    #   from /Users/brantfuller/turing/1module/flash_cards/lib/round.rb:59:in `percent_correct_by_category'
  end
end
