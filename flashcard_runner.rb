require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

def start()

     @index = 1
     @num_cards_round = 0


     # logic to determine test for Iteration 3 or 4 specifications
     puts "Want to load a file or use default Iteration 3 cards? (Type Y to load file cards.txt.)"

     load_file = gets.chomp.to_s

     if load_file == "Y"
          deck = Deck.new(CardGenerator.new("./lib/cards.txt").cards)
     else
          #setup the 8 cards for features of iteration 3 only
          card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
          card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
          card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
          card_4 = Card.new("What is the name of Han Solo's ship?", "Millennium Falcon", :StarWars)
          card_5 = Card.new("What is the famous weapon used by Jedi Knights?", "Light Sabor", :StarWars)
          card_6 = Card.new("How many engines are on an X-wing fighter?", "4", :StarWars)
          card_7 = Card.new("Who is the most loyal friend and first mate of Han Solo's?", "Chewie", :StarWars)
          card_8 = Card.new("What quality did Luke Skywalker lack as the reason Yoda said he didn't want to train Luke?", "Patience", :StarWars)
          deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8])
     end

     @num_cards_round = deck.count
     @round = Round.new(deck)

     def display_welcome
          text = %Q(
          Welcome! Your're playing with #{@num_cards_round} cards.
          --------------------------------------
          )
          puts text
     end

     def display_card
          puts "This is card number #{@index} out of #{@num_cards_round}."
          puts "Question: #{@round.current_card.question}"
          print "Answer?  "
          user_guess = gets.chomp.to_s
          @round.take_turn(user_guess)
          @index += 1
          puts @round.last.feedback
          puts ""
     end

     def display_game_over
          text = %Q(

          ****** Game over! ******
          You had #{@round.number_correct} correct guesses out of #{@num_cards_round} for a total score of #{@round.percent_correct}%.

          STEM - #{@round.percent_correct_by_category(:STEM)}% correct
          Geography - #{@round.percent_correct_by_category(:Geography)}% correct
          Star Wars - #{@round.percent_correct_by_category(:StarWars)}% correct

          Practice makes perfect!

          )

          puts text

          puts "Want to try again? (Y or N)"

          user_try_again = gets.chomp.to_s
          if user_try_again == 'Y'
               start
          else
               puts "Thank you. Good-bye."
          end

     end

     display_welcome

     @num_cards_round.times do
          display_card
     end

     display_game_over

end

start
