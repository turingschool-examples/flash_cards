require './lib/turn'

class Round
attr_reader :deck, :turns, :card_tracker, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @card_tracker = 0
    @number_correct = 0
  end

  def current_card
    deck.cards[card_tracker]
  end

  def take_turn(guess)
    turn = Turn.new(guess, deck.cards[card_tracker])
   @turns << turn
   @card_tracker += 1
   @number_correct += 1 if turn.correct? == true

   turn
  end

  def number_correct_by_category(user_cat)
    count = 0
    
    turns.each do |turn|
      count += 1 if turn.card.category == user_cat && turn.correct? 
    end
    count
  end

  def percent_correct
    correct_count = 0
    total_count = turns.count.to_f

    turns.each do |turn|
      correct_count += 1 if turn.correct? 
    end
    
    
    percent = (correct_count / total_count) * 100
  end

  def percent_correct_by_category(category)
    # reuse method above to count correct answers by category
    correct_count = number_correct_by_category(category).to_f
    total_category_count = 0

    # count turns by category parameter
    turns.each do |turn|
      total_category_count += 1 if turn.card.category == category
    end

    # calculate percentage
    percent = (correct_count / total_category_count) * 100

  end
  
end