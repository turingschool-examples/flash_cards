#require 'pry'
require_relative 'turn'
require_relative 'deck'

class Round
  attr_accessor :deck, :correct, :total, :score, :turns, :correct_by_cat

  def initialize(deck)
    @deck = deck
    @correct = 0
    @total = deck.count
    @turns = 0
    @correct_by_cat = Hash[deck.list_categories.collect {|cat| [cat, 0]}]
  end

  def start
    puts "Let's begin!"
    puts "-" * 50
  end

  def select_card
    @deck.unused_cards.sample
  end

  def take_turn(guess, card)
    turn = Turn.new(guess, card)

    if turn.correct?
      @correct += 1
      @correct_by_cat[card.category.to_s] += 1
    end

    @turns += 1
    @deck.remove_from_deck(card)
    turn.feedback
  end

  def get_score_by_category
    result = Array.new

    @correct_by_cat.each do |cat, val|
      result << "#{cat.split("_").map{|word| word.capitalize}.join(" ")}: #{self.get_score(val, deck.cards_in_category(cat).length)}%"
    end

    result

  end

  def get_score(correct, total)

    (correct.to_f / total.to_f).round(2) * 100
  end
end



