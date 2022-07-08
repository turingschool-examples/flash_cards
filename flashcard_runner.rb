require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

def start
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?','North north west', :STEM)
    card_4 = Card.new('What is Doms favorite color?','Blue', :Random)
    deck = Deck.new([card_1, card_2, card_3, card_4])
    round = Round.new(deck)

    round_count = round.turns.count + 1
    total_count = deck.count

    total_count.times do
        multi_line = "This is card number #{round_count} out of #{total_count}
Question: #{round.current_card.question}"

        puts multi_line

        round.take_turn(gets.chomp)
        round_count += 1

        if round_count > 1
            puts "#{round.turns.last.feedback}"
        end
    end

    multi_line = "******Game Over!******
    You had #{round.number_correct} out of #{total_count} for a total score of #{round.percent_correct}%."

    puts multi_line

    categories = []
    deck.cards.each do |card|
        if !categories.include?(card.category)
            categories << card.category
        end
    end

    categories.map {|category| puts "#{category} - #{round.percent_correct_by_category(category)}% correct."}
end

start()