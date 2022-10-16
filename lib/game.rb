# frozen_string_literal: true
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

# flash_card_runner functionality to execute game
class Game
  def play_with_cards_from_file
    @deck = Deck.new(CardGenerator.new('cards.txt').cards)
    @round = Round.new(@deck)
  end

  def play_with_hardcoded_deck
    @card_1 = Card.new('What color is water?', 'Blue', :Basics)
    @card_2 = Card.new('What color is fire?', 'Red', :Basics)
    @card_3 = Card.new('In what state is Detroit', 'Michigan', :Geography)
    @card_4 = Card.new('What is the Michigan state stone?', 'Petoskey', :Geology)
    @card_5 = Card.new('What is the laziest type of rock?', 'Sedimentary', :Geology)
    @card_5 = Card.new('What is the best IDE?', 'Vim', :STEM)
    @card_6 = Card.new('Initials of the creator of Rails', 'DHH', :STEM)
    @card_7 = Card.new('Author of POODR and Ruby Legend', 'Sandi Metz', :STEM)
    @card_8 = Card.new('What is the abbreviation for Model, View, Controller?', 'MVC', :STEM)
    @card_9 = Card.new('Name of the opensource app store for terminal?', 'Homebrew', :STEM)

    # put those cards into a deck
    @deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7, @card_8, @card_9])

    # create a new round using the deck you created
    @round = Round.new(@deck)
  end

  def display_title(_round)
    puts '
 ███████ ██       █████  ███████ ██   ██  ██████  █████  ██████  ██████  ███████
 ██      ██      ██   ██ ██      ██   ██ ██      ██   ██ ██   ██ ██   ██ ██
 █████   ██      ███████ ███████ ███████ ██      ███████ ██████  ██   ██ ███████
 ██      ██      ██   ██      ██ ██   ██ ██      ██   ██ ██   ██ ██   ██      ██
 ██      ███████ ██   ██ ███████ ██   ██  ██████ ██   ██ ██   ██ ██████  ███████
 '

    puts "Welcome! You're playing with #{@round.cards_in_round} cards."
    puts '-' * 80
  end

  def check_game_type
    valid_game_type = false
    # determine whether to load text file or hardcoded deck
    until valid_game_type
      puts 'Play with hardcoded cards or load cards.txt from root dir?'
      puts '[h]ardcoded cards'
      puts '[l]oad text file'
      print "Enter 'h' or 'l' >> "
      game_type = gets.chomp.downcase
      # only accept proper responses
      if game_type == 'h'
        valid_game_type = true
        play_with_hardcoded_deck
      elsif game_type == 'l'
        valid_game_type = true
        play_with_cards_from_file
      else
        puts "That's... not an option. :( \n\n"
      end
    end
  end

  def game_over
    # game over sequence
    puts ' Game over! '.center(25, '*')
    puts "You had #{@round.number_correct} correct guesses out of #{@round.turn_count + 1} for a total score of #{@round.percent_correct}%"

    # iterate through each category and provide score
    @round.categories.each do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end

    puts @round.percent_correct >= 90 ? "You're a pro, have a nap!" : 'Maybe keep practicing...'
  end

  def game_loop
    # loop all the cards
    until @round.finished?
      puts "This is card number #{@round.turn_count + 1} of #{@round.cards_in_round}."
      puts "Question: #{@round.current_card.question}"
      guess = gets.chomp

      # create new turn with guess
      @round.take_turn(guess)
      puts @round.turns.last.feedback
    end
  end

  # start the round using a new method called start
  def start
    # determine hardcoded or cards.txt game
    check_game_type
    # display the opening title
    display_title(@round)
    # loop the game
    game_loop
    # end game stats
    game_over
  end
end
