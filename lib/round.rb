require 'pry'
class Round
attr_reader :deck, :turns, :number_correct_turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct_turns = 0
    @cards_per_e_category = {}
    @correct_by_category = {}
    @cycle_deck = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess,@deck.cards.first)
    @deck.cards.shift
    @turns << new_turn
    new_turn
  end

  def current_card
    @deck.cards.first
  end

  def number_correct
    turns.each do |turn|
      if turn.correct?
        @number_correct_turns += 1
      end
    end
    @number_correct_turns
  end

  def create_categories
    @turns.each do |turn|
      @cards_per_e_category[turn.card.category] = 0
      @correct_by_category[turn.card.category] = 0
    end
  end

  def cards_per_category
    @turns.each do |turn|
      @cards_per_e_category[turn.card.category] += 1
    end
  end


  def number_correct_by_category(category)
    create_categories
    cards_per_category
    @turns.each do |turn|
      if turn.correct?
        @correct_by_category[turn.card.category] += 1
      end
    end
    @correct_by_category[category]
  end

  def percent_correct
    ( @number_correct_turns.to_f / @turns.length ) * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category)
    (@correct_by_category[category].to_f / @cards_per_e_category[category] ) * 100
  end

end
