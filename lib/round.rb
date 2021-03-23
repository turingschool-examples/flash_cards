class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct_count = 0
  end

  def current_card
    @deck.cards[0]
    # require 'pry'; binding.pry
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    # require 'pry'; binding.pry
    @turns.last
  end

  def number_correct
    @turns.each do |turn|
      if turn.correct? == true
        @number_correct_count += 1
      end
    end
    @number_correct_count
  end
end
