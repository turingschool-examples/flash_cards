require_relative 'turn'
require_relative 'deck'

class Round
  attr_accessor :deck, :correct, :total, :score, :turns

  def initialize(deck)
    @deck = deck
    @correct = 0
    @total = deck.count
    @turns = 0
  end

  def start
    puts "Great choice! Let's begin."
    puts "-" * 50
  end

  def select_card
    @deck.cards.sample
  end

  def take_turn(guess, card)
    turn = Turn.new(guess, card)

    if turn.correct?
      @correct += 1
    end

    @turns += 1
    @deck.remove_from_deck(card)
    puts turn.feedback
  end

  def get_score(correct, total)
    (correct.to_f / total.to_f).round(2) * 100
  end
end

