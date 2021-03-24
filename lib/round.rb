require './lib/card'
require "./lib/turn"
require "./lib/deck"

class Round
  attr_reader :turns,
              :deck

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
  end

  def take_turn(guess)
    @guess = guess
    if @current_card < @deck.cards.count
      @new_turn = Turn.new(@guess, @deck.cards[@current_card])
      @turns.push(@new_turn)
      @new_turn
    elsif @current_card >= @deck.cards.count
      puts "****** Game Over!******"
      # puts "You had #{self.Round.number_correct} correct guesses out of #{@deck.cards.count} for a total core of #{}"
    else
      "Error!!!"
    end
    @current_card =+ 1
  end

  def current_card
    @deck.cards[@current_card]
  end

  def self.number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct
      self.class.number_correct
  end

  def self.number_corret_by_category(category_to_count_correct)
    @category_to_count_correct = category_to_count_correct
    @cards_turned_deck = Deck.new(@turns)
    @category_cards_seen = @cards_turned_deck.cards_in_category(@category_to_count_correct)
    @category_cards_seen.count do |turn|
      turn.correct?
    end
  end

  def number_corret_by_category
    self.number_corret_by_category(self)
  end

  def self.percent_correct
    @deck_cards_seen = Deck.new(@turns)
    (self.number_correct / @deck_cards_seen.count) * 100
  end

  def percent_correct
    self.percent_correct
  end

  def self.percent_correct_by_category(catagory_percent_check)
    @catagory_percent_check = catagory_percent_check
    @category_turn_deck = Deck.new(@turns)
    @category_percent_correct = @category_turn_deck.cards_in_category(@catagory_percent_check)
    @category_correct = @category_percent_correct.count do |turn|
      turn.correct?
    end
    @category_total = @category_turn_deck.count
    @category_percent_correct = (@category_correct / @category_total) * 100
  end

  def percent_correct_by_category
    self.percent_correct_by_category
  end
end
