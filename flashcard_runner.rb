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
# should this runner file hold this much?

  def start_game
    puts messages.separator
    puts messages.welcome
    puts messages.amount_of_cards
    puts messages.quit_info
    puts messages.separator
    first_question
  end

  def first_question
    puts messages.card_out_of(card_1)
    puts messages.questions(card_1)

    print "> "
    @user_input = $stdin.gets.chomp
    second_question
  end

  def try_again(card)
    if @user_input != "q"
      puts messages.incorrect
      puts messages.separator
      puts messages.questions(card)
      print "> "
      @user_input = $stdin.gets.chomp
    end
  end

  def second_question
    if @user_input == card_1.answer
      puts "Gosh, great job! You got that right!"
      puts messages.separator
      puts messages.card_out_of(card_2)
      puts messages.questions(card_2)

      print "> "
      @user_input = $stdin.gets.chomp
      third_question
    elsif
      try_again(card_1)
      second_question
    else
      @user_input == "q"
      puts messages.quit
    end
  end

  def third_question
    if @user_input == card_2.answer
      puts "Yes! Yay! Glad you're old enough to know that one!"
      puts messages.separator
      puts messages.card_out_of(card_3)
      puts messages.questions(card_3)

      print "> "
      @user_input = $stdin.gets.chomp
      fourth_question
    elsif
      try_again(card_2)
      third_question
    else
      @user_input == "q"
      puts messages.quit
    end
  end

  def fourth_question
    if @user_input == card_3.answer
      puts "Correct! That was a tricky one."
      puts messages.separator
      puts messages.card_out_of(card_4)
      puts messages.questions(card_4)

      print "> "
      @user_input = $stdin.gets.chomp
      last_answer
    elsif
      try_again(card_3)
      fourth_question
    else
      @user_input == "q"
      puts messages.quit
    end
  end

  def last_answer
    if @user_input == card_4.answer
      puts "Yes! Someone sure was listening in class!"
      puts messages.separator
      ############## #FIX - add percent methods here - FIX# ##############
    elsif
      try_again(card_4)
      fourth_question
    else
      @user_input == "q"
      puts messages.quit
    end
  end
end

st = Start.new
st.start_game
