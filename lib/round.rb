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

  def number_correct_by_category(ctgry)
    correct = turns.select {|turn| turn.card.category == ctgry && turn.correct?}
    correct.count
  end

  def percent_correct
    total = turns.count.to_f
    correct = turns.select { |turn| turn.correct?}
    percent = (correct.count / total) * 100
  end

  def percent_correct_by_category(category)
    correct_count = number_correct_by_category(category).to_f
    cards_in_category = turns.select {|turn| turn.card.category == category}
    percent = (correct_count / cards_in_category.count) * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.length} cards."
    puts "-------------------------------------------------"
    
    deck.cards.each do |card|
      puts "This is card number #{@card_tracker + 1} out of #{deck.cards.length}."
      puts "Question: #{deck.cards[card_tracker].question}"

      guess = gets.chomp
      take_turn(guess)
      puts turns.last.feedback
    end
    
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{turns.length} for a total score of #{percent_correct.round}%."
    print_category_stats()
  end

  def print_category_stats
    categories = deck.cards.map do |card|
      card.category
    end
    
    categories = categories.uniq
    categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category)}% correct."
    end
  end
end