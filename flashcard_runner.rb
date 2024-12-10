require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

      card_1 = Card.new("What state was Chase born in?", "Oregon", :Geography)
      card_2 = Card.new("Is Chase one of the greatest scientific minds of our lifetime?", "No", :STEM)
      card_3 = Card.new("What is Chase's favorite piece of technological innovation? ONE WORD ANSWERS ONLY, Chase doesn't have unlimited talk,text, OR data", "Microwave", :STEM)
      
      cards = [card_1, card_2, card_3]
      
      deck = Deck.new(cards)
      round = Round.new(deck)

      def start_game(round)
            initial_card_count = round.deck.cards.size

            puts ""
            puts ""
            puts ""
            puts "Welcome! Chase would like to play his favorite game, he even gave it a cool title... HOW WELL DO YOU KNOW CHASE, the Trivia Game!!!"
            puts ""
            puts "***FURIOUS CLAPPING CAN BE HEARD ALL AROUND YOU***"
            puts ""
            puts "Why aren't you clapping? You should absolutely be clapping..."
            puts ""
            puts "-------------------------------------"
            puts ""

            while !round.deck.cards.empty? do
                  puts "This is question number #{round.turns.count + 1} of #{initial_card_count}....DUN DUN DUNNNNNNNN!..."
                  puts round.current_card.question
                  guess = gets.chomp
                  round.take_turn(guess)

                  if round.turns.last.correct?
                     puts round.turns.last.feedback
                  else 
                     puts round.turns.last.feedback
                  end


            
            end

            def provide_feedback(round)

                  puts "--------------------------"
                  puts "This Game is OVER, do you really know Chase?!!"
                  puts "You answered #{round.percent_correct.round(1)} % of these questions correctly. That's okay I guess."
                  puts "-------------------------"
                  puts "You answered #{round.percent_correct_by_category(:Geography)} % of Chase's Geographical Mystery questions correctly."
                  puts "You answered #{round.percent_correct_by_category(:STEM)} % of the Chase In Stem questions correctly. Chase doesn't read books,especially cookbooks, reading is for NERDS."
                  puts "Thank you for being another lukewarm contestant on....HOW WELL DO YOU KNOW CHASE!!!"
                  puts ""
                  puts ""
                  puts " THIS GAME IS OVER WHY ARE YOU STILL LINGERING? Chase really doesn't appreciate LINGERERS!"
                  
                  
                    
                   
                    
                  
             end

      end

      start_game(round)
      provide_feedback(round)


