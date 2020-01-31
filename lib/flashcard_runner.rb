require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'



card1 = Card.new("What is 5 + 5", '10', :Math)
card2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
card3 = Card.new("What is 42 / 7", '6', :Math)
card4 = Card.new("Who was the first governor of Wyoming?", "John Campbell", :History)
card5 = Card.new("What is Mike's middle name?","nobody knows",:Turing_Staff)
card6 = Card.new("What is Rachel's favorite animal", 'panda',:Turing_Staff)
card7 = Card.new("What cardboard cutout lives at Turing?",'Justin Bieber',:Pop_Culture)
deck = Deck.new([card1, card2, card3, card4, card5, card6, card7])
round = Round.new(deck)


def start(round_parameter)
  count = 1
  category_holder = []
  puts "Welcome! You're playing with #{round_parameter.deck.count} cards"
  puts "-" * 50
  round_parameter.deck.cards.each do |card|
    puts "This is card number #{count} out of #{round_parameter.deck.count}"
    puts "Question: #{card.question}"
    puts "What is your guess"
    input = gets.chomp
    category_holder << card.category
    turn = round_parameter.take_turn(input)
    puts turn.feedback
    count += 1
  end
  puts "********* GAME OVER *********"
  puts "You had #{round_parameter.number_correct} out of #{round_parameter.deck.count} for total score of #{round_parameter.percent_correct}%"

  already_shown = [:junk]
  category_holder.each do |percent_print|
    has_shown = false
    already_shown.each do |check|
      if check == percent_print
        has_shown = true
      end
    end
    if has_shown == false
      puts "#{percent_print} - #{round_parameter.percent_correct_by_category(percent_print)}% correct"
      already_shown << percent_print
    end
  end
end

start(round)
