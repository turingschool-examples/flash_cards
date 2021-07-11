require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

filename = 'lib/cards.txt'
@cards = CardGenerator.new(filename)
@deck = Deck.new(@cards.cards.shuffle)
@round = Round.new(@deck)

def print_slow(text)
  text.split(//).each do |char|
    sleep 0.05
    print char
  end
  puts
end

print_slow('Welcome to Flash Cards!')
sleep 1
print_slow "\nYou're playing with #{@cards.cards.length} cards.\nYou must score 80% correct or higher to win.\n"
50.times { print '-' }
sleep 1

def play_flashcards
  while @round.turns.length < @cards.cards.length
    puts "\nThis is card number #{@round.turns.length + 1} out of #{@cards.cards.length}."
    puts "Question: #{@round.current_card.question}"
    print 'Answer: '

    guess = gets.strip

    while guess == ''
      print "Try entering some words...\nAnswer: "
      guess = gets.strip
    end

    turn = @round.take_turn(guess)

    puts turn.feedback
    sleep 1
    50.times { print '-' }
  end

  if @round.turns.length == @cards.cards.length
    puts "\n\n****** Game over! ******\n\n"

    guess = if @round.number_correct == 1
              'guess'
            else
              'guesses'
            end

    if @round.percent_correct > 80.0
      print_slow "Congrats! You win!\n\n"
    else
      print_slow "As Willy Wonka would say...YOU LOSE!\n"
    end

    sleep 1
    puts "You had #{@round.number_correct} correct #{guess} out of #{@cards.cards.length} for a total score of #{@round.percent_correct.to_i}% correct."
    sleep 3
    puts "\nCategories:"

    categories = @cards.cards.map do |card|
      card.category
    end

    categories.uniq.map do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category).to_i}% correct"
    end
  end
end

play_flashcards
