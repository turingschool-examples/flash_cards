  require './lib/card'
  require './lib/turn'
  require './lib/deck'
  require './lib/round'
  require './lib/card_generator'
  require 'pry'

class Play_Game

    def initialize
      @card_1 = Card.new("Question: 1 + 1 = ?", "2", :Math)
      @card_2 = Card.new("Question: 1 + 2 = ?", "3", :Math)
      @card_3 = Card.new("Question: What food do I like to eat now?", "Humus", :Food)
      @card_4 = Card.new("Question: What other food do I like to eat now?", "Grapes", :Food)
      @cards = [@card_1, @card_2, @card_3, @card_4]
      @cards_in_file = CardGenerator.new("cards.txt")
      @deck = Deck.new(@cards_in_file.cards)
      @round = Round.new(@deck)
      @round_number = 0
    end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    50.times {print "-"}
  end

  def question
    @round_number +=1
    puts "\nThis is card number #{@round_number} out of #{4} " #Add way to look at how many cards in deck. Cards shift out of deck so out of keeps subtracting
    puts @round.current_card.question
    guess
  end

  def guess
    @user_guess = gets.chomp
    @new_turn = Turn.new(@user_guess, @round.current_card)
    puts @new_turn.feedback
    @round.take_turn(@user_guess)
      if @round_number == 4
        end_game
      else
        question
      end
  end

  def end_game
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of 4 for a total score of #{@round.percent_correct}%."

    puts "#{:Math} - #{@round.percent_correct_by_category(:Math)}% correct"
    puts "#{:Food} - #{@round.percent_correct_by_category(:Food)}% correct"
    exit
  end


end

  game = Play_Game.new
  game.start
  game.question
  game.guess
