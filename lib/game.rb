require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Game
  attr_reader  :card_1,
                    :card_2,
                    :card_3,
                    :card_4,
                    :deck,
                    :round,
                    :begin,
                    :user_input

  def initialize
    @card_1 = Card.new("What is the name of the greatest coding bootcamp ever established?", "turing", :Education)
    @card_2 = Card.new("What's the name of the Big Red Dog?", "clifford", :Wisdom)
    @card_3 = Card.new("Is an avocado a fruit or a vegetable?", "fruit", :Science)
    @card_4 = Card.new("What is the return value of .each?", "the original array", :Wisdom)
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @round = Round.new(deck)
    @begin = 0
    @user_input = user_input
  end

  def start_game
    @begin = deck.count
    beginning
    game_play
    ending_message
  end

  def game_play
    while round.deck.cards.empty? != true
      puts card_out_of
      puts questions
      print "> "
      @user_input = $stdin.gets.chomp.downcase
      puts feedback
      round.take_turn(@user_input)
      puts separator
      break if @user_input == "q"
    end
  end

  def beginning
    puts separator
    puts welcome
    puts amount_of_cards
    puts quit_info
    puts separator
  end

  def separator
    "- " * 50
  end

  def welcome
    "✨ " * 5 + "Welcome to flashcards!" + "✨ " * 5
  end

  def amount_of_cards
    "You're playing with #{deck.count} cards."
  end

  def feedback
    if round.current_card.answer == @user_input
      "Gosh, great job! You got that right!"
    else
      "Sorry, that's not quite right."
    end
  end

  def quit_info
    "You can press 'q' to quit at any time....but it would be really fun if you play!"
  end

  def card_out_of
    "This is card number #{round.card_num} out of #{@begin}."
  end

  def questions
    "Question: #{round.current_card.question}"
  end

  def incorrect
    "Sorry, that's incorrect."
  end

  def ending_message
    puts "✨ " * 5 + "The game is finished, YOU DID IT!" + "✨ " * 5
    puts "You had #{round.number_correct} correct guesses out of #{@begin} for a total score of #{round.percent_correct.to_i}%."
    puts "Education - #{round.percent_correct_by_category(:Education)}"
    puts "Wisdom - #{round.percent_correct_by_category(:Wisdom)}"
    puts "Science - #{round.percent_correct_by_category(:Science)}"
    puts "- " * 50
  end
end
