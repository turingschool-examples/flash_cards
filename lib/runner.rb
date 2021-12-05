require_relative './turn'
require_relative './deck'
require_relative './round'
require_relative './card_generator'

class FlashCardRunner
  def initialize
    @deck = Deck.new(CardGenerator.new('./cards.txt').cards)
    @round = Round.new(@deck)
  end

  def start
    until @deck.cards.empty? do
      system('clear')
      print_header
      print_question
      input_guess
      sleep(1)
      system('clear')
    end
    print_end_game
  end

  def print_header
    puts "Welcome, you're playing with #{@deck.size} cards"
    puts "This is card #{@round.count} out of #{@deck.size + @round.count}"
    puts '---------------------------------'
  end

  def print_question
    puts  "Question: #{@round.question}"
    print 'Answer: '
  end

  def input_guess
    guess = gets.chomp
    turn = @round.take_turn(guess)
    print_feedback(turn)
  end

  def print_feedback(turn)
    puts turn.feedback
    print " (#{turn.card.answer})\n" unless turn.correct?
  end

  def print_end_game
    puts '****** Game Over! ******'
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.size + @round.count} for a total score of #{@round.percent_correct}%."
    print_percent_by_category
  end

  def print_percent_by_category
    categories = []
    round.turns.each do |turn|
      categories << turn.card.category
    end
    categories.uniq.each do |category|
      puts "#{category}: #{@round.percent_correct_by_category(category)}% correct"
    end
  end
end
