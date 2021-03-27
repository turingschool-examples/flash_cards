require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Start
  attr_reader  :card_1,
                    :card_2,
                    :card_3,
                    :card_4,
                    :deck,
                    :round,
                    :welcome

  def initialize
    @card_1 = Card.new("What is the capital of Washington State?", "Olympia", :Geography)
    @card_2 = Card.new("Who is the author of Green Eggs and Ham?", "Dr. Seuss", :Wisdom)
    @card_3 = Card.new("Is an avocado a fruit or a vegetable?", "Fruit", :Science)
    @card_4 = Card.new("What is Megan's dog's name?", "Nile", :Wisdom)
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @round = Round.new(deck)
    @welcome = welcome
  end


  def start_game
    puts "- " * 50
    puts "Welcome to flashcards!"
    puts "You're playing with #{deck.count} cards."
    puts "- " * 50
    puts "This is card number 1 out of #{deck.count}." #FIX - card out of
    puts "Question: #{card_1.question}"

    print "> "
    @welcome = $stdin.gets.chomp
    first_answer
  end

  def first_answer
    if @welcome == "Olympia" #FIX - HARD CODED
      puts "Correct"
      puts "- " * 50
      puts "This is card number 2 out of #{deck.count}." #FIX - card out of
      puts "Question: #{card_2.question}"

      print "> "
      @welcome = $stdin.gets.chomp
      second_answer
    elsif
      @welcome != "q"
      puts "Sorry, that's incorrect."
      puts "Please try again"
      puts "- " * 50
      puts "Question: #{card_1.question}"
      print "> "
      @welcome = $stdin.gets.chomp
    else
      @welcome == "q"
      puts "Okay, guess you're done now."
    end
  end

  def second_answer
    if @welcome == "Dr. Seuss" #FIX - HARD CODED
      puts "Correct"
      puts "- " * 50
      puts "This is card number 3 out of #{deck.count}." #FIX - card out of
      puts "Question: #{card_3.question}"

      print "> "
      @welcome = $stdin.gets.chomp
      third_answer
    elsif
      @welcome != "q"
      puts "Sorry, that's incorrect."
      puts "Please try again"
      puts "- " * 50
      puts "Question: #{card_2.question}"
      print "> "
      @welcome = $stdin.gets.chomp
    else
      @welcome == "q"
      puts "Okay, guess you're done now."
    end
  end

  def third_answer
    if @welcome == "fruit" #FIX - HARD CODED
      puts "Correct"
      puts "- " * 50
      puts "This is card number 4 out of #{deck.count}." #FIX - card out of
      puts "Question: #{card_4.question}"

      print "> "
      @welcome = $stdin.gets.chomp
      fourth_answer
    elsif
      @welcome != "q"
      puts "Sorry, that's incorrect."
      puts "Please try again"
      puts "- " * 50
      puts "Question: #{card_3.question}"
      print "> "
      @welcome = $stdin.gets.chomp
    else
      @welcome == "q"
      puts "Okay, guess you're done now."
    end
  end

  def fourth_answer
    if @welcome == "Nile" #FIX - HARD CODED
      puts "Correct"
      puts "- " * 50
      # third_answer
    elsif
      @welcome != "q"
      puts "Sorry, that's incorrect."
      puts "Please try again"
      puts "- " * 50
      puts "Question: #{card_4.question}"
      print "> "
      @welcome = $stdin.gets.chomp
    else
      @welcome == "q"
      puts "Okay, guess you're done now."
    end
  end
end

st = Start.new
st.start_game
