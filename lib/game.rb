class Game
  attr_reader :round
  def initialize(round)
    @round = round
  end

  def start
    welcome_statement
    @round.deck.cards.length.times do
      puts "This is card #{@round.turns.length + 1} out of #{number_of_cards}."
      puts "Question: #{@round.current_card.question}"
      answer = gets.chomp
      new_turn = round.take_turn(answer)
      puts "#{new_turn.feedback}"
    end
    end_of_game_stats
  end

  def welcome_statement
    puts "Welcome! You're playing with #{number_of_cards} cards."
    puts "-------------------------------------------------"
  end

  def number_of_cards
    @round.deck.cards.length
  end

  def end_of_game_stats
    puts "****** Game over! ******"
    print "You had #{@round.number_correct} correct guesses "
    print "out of #{@round.turns.length} "
    puts "for a total score of #{@round.percent_correct}%."
    stats_by_category
  end

  def stats_by_category
    index = 0
    while index < array_of_categories.length
      index += 1
      print "#{array_of_categories[index - 1]} - "
      puts "#{round.percent_correct_by_category(array_of_categories[index - 1])}% correct"
    end
  end

  def array_of_categories
    categories = []
    @round.turns.each do |turn|
      if !categories.include?(turn.card.category)
        categories.push(turn.card.category)
      end
    end
    categories
  end
end
