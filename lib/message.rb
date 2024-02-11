class Message

    attr_reader :round

    def initialize (round)
        @round = round
    end

    def welcome
        puts " "
        puts "Welcome to Grant's Game!"
        puts "10 questions, 10 answers - how will you fare?"
        puts "---------------------------------------------"
    end

    def end_summary
        puts " "
        puts "Game Over! Let's see how you did..."
        puts " "
        puts "Game Summary:"
        puts "-------------"
        puts "You successfully guessed #{@round.number_correct} out of #{@round.deck.cards.count} cards (#{@round.percent_correct}%)!"
        puts " "
        puts "Geography - #{@round.percent_correct_by_category(:Geography)}% correct"
        puts "Math - #{@round.percent_correct_by_category(:Math)}% correct"
        puts "Space - #{@round.percent_correct_by_category(:Space)}% correct"
        puts "Bonus - #{@round.percent_correct_by_category(:Bonus)}% correct"
        puts " "
        puts "See you next time!"
        puts " "
    end

end