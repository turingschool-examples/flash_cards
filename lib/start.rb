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
                    :turns,
                    :round,
                    :messages,
                    :begin,
                    :user_input

  def initialize
    @card_1 = Card.new("What is the name of the greatest coding bootcamp ever established?", "turing", :Education)
    @card_2 = Card.new("What's the name of the Big Red Dog?", "clifford", :Wisdom)
    @card_3 = Card.new("Is an avocado a fruit or a vegetable?", "fruit", :Science)
    @card_4 = Card.new("What is the return value of .each?", "the original array", :Wisdom)
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @turns = []
    @round = Round.new(deck)
    @messages = Messages.new(card_1, card_2, card_3, card_4)
    @begin = 0
    @user_input = user_input
  end

  def start_game
    @begin = deck.count
    messages.beginning
      until round.deck.cards.empty? == true
        puts card_out_of
        puts questions

        print "> "
        @user_input = $stdin.gets.chomp.downcase
        round.take_turn(@user_input)
        puts "Gosh, great job! You got that right!" # FIX you have this hard coded
        puts messages.separator
      end
    ending_message
  end

  def card_out_of
    "This is card number #{round.card_num} out of #{@begin}."
  end

  def questions
    "Question: #{round.current_card.question}"
  end

  def separator
    "- " * 50
  end

  def welcome
    "Welcome to flashcards!"
  end

  def amount_of_cards
    "You're playing with #{deck.count} cards."
  end

  def quit_info
    "You can press 'q' to quit at any time....but it would be really fun if you play!"
  end

  def beginning
    puts separator
    puts welcome
    puts amount_of_cards
    puts quit_info
    puts separator
  end

  def incorrect
    "Sorry, that's incorrect. Please try again."
  end

  def quit
    "Okay, guess you're done now, bummer."
  end
  
  def ending_message
    puts "~ ~ ~ ~ ~ ~ ~ The game is finished, you did it! ~ ~ ~ ~ ~ ~ ~"
    puts "You had #{round.number_correct} correct guesses out of #{@begin} for a total schore of #{round.percent_correct}%."
    puts "Education - #{round.percent_correct_by_category(:Education)}"
    puts "Wisdom - #{round.percent_correct_by_category(:Wisdom)}"
    puts "Science - #{round.percent_correct_by_category(:Science)}"
    puts "~ " * 50
  end






  # def first_question #WORKS
  #   puts messages.card_out_of(card_1)
  #   puts messages.questions
  #
  #   print "> "
  #   @user_input = $stdin.gets.chomp
  #   second_question
  #   round.take_turn("turing")
  # end
  #
  # def second_question
  #   if @user_input == round.current_card.answer
  #     puts messages.separator
  #     puts messages.card_out_of(card_2)
  #     puts messages.questions
  #
  #     print "> "
  #     @user_input = $stdin.gets.chomp
  #     third_question
  #   elsif @user_input == "q"
  #     puts messages.quit
  #   end
  # end
  #
  # def third_question
  #   if @user_input == round.current_card.answer
  #     puts "Yes! Yay! Glad you're old enough to know that one!"
  #     puts messages.separator
  #     puts messages.card_out_of(card_3)
  #     puts messages.questions
  #
  #     print "> "
  #     @user_input = $stdin.gets.chomp
  #     fourth_question
  #   elsif @user_input == "q"
  #     puts messages.quit
  #   end
  # end
  #
  # def fourth_question
  #   if @user_input == round.current_card.answer
  #     puts "Correct! That was a tricky one."
  #     puts messages.separator
  #     puts messages.card_out_of(card_4)
  #     puts messages.questions
  #
  #     print "> "
  #     @user_input = $stdin.gets.chomp
  #     last_answer
  #   elsif @user_input == "q"
  #     puts messages.quit
  #   end
  # end
  #
  # def last_answer
  #   if @user_input == round.current_card.answer
  #     puts "Yes! Someone sure was listening in class!"
  #     puts messages.separator
  #     puts "Game over, you did it!"
  #     # puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}."
  #     # puts "#{card.category} - #{round.percent_correct_by_category(category)}% correct"
  #   elsif @user_input == "q"
  #     puts messages.quit
  #   end
  # end
end
