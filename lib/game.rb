class Game

    attr_reader :round

    def initialize (round)
        @round = round
    end

    def start
        welcome_message = Message.new(@round)
        welcome_message.welcome

        counter = 1
        @round.deck.count.times do
            puts " "
            puts "Card #{counter}: #{@round.current_card.question}"
            print "Answer: " 
            guess = gets.chomp
            new_turn = @round.take_turn(guess)
            puts new_turn.feedback
            counter += 1
            sleep (0.20)
        end

        game_summary = Message.new(@round)
        game_summary.end_summary
    end

end