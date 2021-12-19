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
      print_header
      print_question
      input_guess
      print_feedback(@turn)
      next_question
    end
    print_end_game
  end

  def print_header
    system('clear')
    puts "Welcome, you're playing with #{@deck.size + @round.count} cards\n"
    puts "\nThis is card #{@round.count} out of #{@deck.size + @round.count}\n"
    puts "\n---------------------------------\n"
  end

  def print_question
    puts  "\nQuestion: #{@round.question}\n"
    print "\nAnswer: "
  end

  def input_guess
    @turn = @round.take_turn(gets.chomp)
  end

  def next_question
    sleep(0.5)
    print "\nPress ENTER for the next question"
    gets
    system('clear')
  end

  def print_feedback(turn)
    puts
    print turn.feedback
    turn.correct? ? puts : (print "! || Answer: #{turn.card.answer}\n")
  end

  def print_end_game
    puts '****** Game Over! ******'
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.size + @round.count} for a total score of #{@round.percent_correct}%."
    print_percent_by_category
  end

  def print_percent_by_category
    @round.turns.map { |turn| turn.card.category }.uniq.each do |category|
      puts "#{category.capitalize}: #{@round.percent_correct_by_category(category)}% correct"
    end
  end
end
