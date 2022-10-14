require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
  attr_reader :deck, :turns #:number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    # @number_correct = 0
  end

  def current_card
    current_card = @deck.cards # defines local variable to be an array of cards stored in the deck
    current_card[turns.count] # pulls current card from deck based on the number of turns completed
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn # puts new turn into the @turns array
    # if new_turn.correct?
    #   @number_correct += 1
    # end
    return new_turn
  end

  def number_correct
    correct_count = 0 
    turns.each do |turn|
      if turn.correct? # calls the correct? method from the turn class and if true adds one to the counter
        correct_count += 1
      end
    end
    correct_count
  end

  def number_correct_by_category(category)
    match_category = [] # temp storage for filtered cards
    correct_in_category = 0
    turns.each do |turn|
      if turn.card.category == category # filters each card based on category
        match_category << turn 
      end
    end
    match_category.each do |card| 
      if card.correct? # calls the correct? method on each card that was filtered into match_category
        correct_in_category += 1 # adds 1 to counter if correct? is true
      end
    end
    correct_in_category
  end

  def percent_correct # converts number_correct into a percentage of turns
    ((number_correct.to_f / turns.count).round(2)) * 100 
  end

  def percent_correct_by_category(category)
    match_category = [] # temp storage for filtered cards
    correct_in_category = 0
    turns.each do |turn| 
      if turn.card.category == category # filters each card based on category
        match_category << turn 
      end
    end
    match_category.each do |card|
      if card.correct? # calls the correct? method on each card that was filtered into match_category
        correct_in_category += 1 # adds 1 to counter if correct? is true
      end
    end
    ((correct_in_category.to_f / match_category.count).round(2)) * 100 # converts correct_in_category into a percentage based on amount of cards with certain category
  end

end