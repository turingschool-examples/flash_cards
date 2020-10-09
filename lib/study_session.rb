class StudySession
  require './lib/card'
  require './lib/turn'
  require './lib/deck'
  require './lib/round'

  attr_reader :card_1,
              :card_2,
              :card_3,
              :card_4,
              :card_5,
              :cards,
              :deck,
              :round

  def initialize
    @card_1 = Card.new('How do you say "fish" in German?', 'fisch', :German)
    @card_2 = Card.new('How do you say "market" in German?', 'markt', :German)
    @card_3 = Card.new('How do you say "space" in Spanish?', 'espacio', :Spanish)
    @card_4 = Card.new('How do you say "village" in Spanish?', 'aldeano', :Spanish)
    @card_5 = Card.new('How do you say "pudding" in Portuguese?', 'pudim', :Portuguese)
    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5]
    @deck = Deck.new(cards)
    @round = Round.new(deck)
  end

  def start
    puts welcome_message
    review_cards
    final_results
  end

  def welcome_message
    "Welcome! You're playing with #{@deck.cards.count} cards.\n" +
    "-------------------------------------------------"
  end

  def card_details
    "This is card #{@round.turns.count + 1} of #{@deck.cards.count}\n" +
    "Question: #{@round.current_card.question}"
  end

  def review_cards
    until @deck.cards.count == @round.turns.count
      puts card_details
      user_input = gets.chomp
      new_turn = @round.take_turn(user_input)
      puts "#{new_turn.feedback}"
    end
  end

  def final_results
    puts "****** Game Over! ******"
    puts "You had #{@round.number_correct} correct guesses of #{@deck.cards.count} for a total score of #{@round.percent_correct}"
    results_by_category
  end
# helper for results by catgory
  def find_categories
    categories = @deck.cards.group_by do |card|
      card.category
    end
    categories.keys
  end

  def results_by_category
    find_categories.each do |category|
      puts "#{category.to_s} - #{@round.percent_correct_by_category(category)}% correct"
    end
  end
end
