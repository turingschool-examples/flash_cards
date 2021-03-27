require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/messages'

class Start
  attr_reader  :card_1,
                    :card_2,
                    :card_3,
                    :card_4,
                    :deck,
                    :round,
                    :messages,
                    :user_input

  def initialize
    @card_1 = Card.new("What is the name of the greatest coding bootcamp ever established?", "turing", :Geography)
    @card_2 = Card.new("What's the name of the Big Red Dog?", "clifford", :Wisdom)
    @card_3 = Card.new("Is an avocado a fruit or a vegetable?", "fruit", :Science)
    @card_4 = Card.new("What is the return value of .each?", "the original array", :Wisdom)
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @round = Round.new(deck)
    @messages = Messages.new(card_1, card_2, card_3, card_4)
    @user_input = user_input
  end
# #FIX# #
# need to refactor methods
# put into messages file?
# should this runner file hold this much?

  def start_game
    puts messages.separator
    puts messages.welcome
    puts messages.amount_of_cards
    puts messages.quit_info
    puts messages.separator
    puts messages.card_out_of(card_1)
    puts "Question: #{card_1.question}"

    print "> "
    @user_input = $stdin.gets.chomp
    first_question
  end

  def first_question
    if @user_input == card_1.answer
      puts "Gosh, great job! You got that right!"
      puts messages.separator
      puts messages.card_out_of(card_2)
      puts "Question: #{card_2.question}"

      print "> "
      @user_input = $stdin.gets.chomp
      second_question
    elsif
      @user_input != "q"
      puts "Sorry, that's incorrect."
      puts "Please try again"
      puts messages.separator
      puts "Question: #{card_1.question}"
      print "> "
      @user_input = $stdin.gets.chomp
      first_question
    else
      @user_input == "q"
      puts messages.quit
    end
  end

  def second_question
    if @user_input == card_2.answer
      puts "Yes! Yay! Glad you're old enough to know that one!"
      puts messages.separator
      puts messages.card_out_of(card_3)
      puts "Question: #{card_3.question}"

      print "> "
      @user_input = $stdin.gets.chomp
      third_question
    elsif
      @user_input != "q"
      puts "Sorry, that's incorrect."
      puts "Please try again"
      puts messages.separator
      puts "Question: #{card_2.question}"
      print "> "
      @user_input = $stdin.gets.chomp
      second_question
    else
      @user_input == "q"
      puts messages.quit
    end
  end

  def third_question
    if @user_input == card_3.answer
      puts "Correct! That was a tricky one."
      puts messages.separator
      puts messages.card_out_of(card_4)
      puts "Question: #{card_4.question}"

      print "> "
      @user_input = $stdin.gets.chomp
      fourth_question
    elsif
      @user_input != "q"
      puts "Sorry, that's incorrect."
      puts "Please try again"
      puts messages.separator
      puts "Question: #{card_3.question}"
      print "> "
      @user_input = $stdin.gets.chomp
      third_question
    else
      @user_input == "q"
      puts messages.quit
    end
  end

  def fourth_question
    if @user_input == card_4.answer
      puts "Yes! Someone sure was listening in class!"
      puts messages.separator
      ############## #FIX - add percent methods here - FIX# ##############
    elsif
      @user_input != "q"
      puts "Sorry, that's incorrect."
      puts "Please try again"
      puts messages.separator
      puts "Question: #{card_4.question}"
      print "> "
      @user_input = $stdin.gets.chomp
      fourth_question
    else
      @user_input == "q"
      puts messages.quit
    end
  end
end

st = Start.new
st.start_game
