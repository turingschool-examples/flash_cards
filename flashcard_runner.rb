require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

def print_slow(text)
  text.split(//).each do |char|
    sleep 0.05
    print char
  end
  puts
end

print_slow('Welcome to Flash Cards!')
sleep 1
puts 'How many cards would you like to play with?'

@number_of_cards = gets.strip.to_i

while @number_of_cards < 1 || @number_of_cards.class != Integer
  puts 'Try typing a positive integer...'
  @number_of_cards = gets.strip.to_i
end

filename = 'cards.txt'
@max_num_of_cards = CardGenerator.new(filename).cards.length
@cards = CardGenerator.new(filename).cards.sample(@number_of_cards)
@deck = Deck.new(@cards)
@round = Round.new(@deck)

while @number_of_cards > @deck.count || @number_of_cards < 1 || @number_of_cards.class != Integer
  puts "Please choose a number between 1 and #{@max_num_of_cards}"
  @number_of_cards = gets.strip.to_i
end

print_slow "\nYou're playing with #{@number_of_cards} cards.\nYou must score 80% correct or higher to win.\n"
50.times { print '-' }
sleep 1

def play_flashcards
  while @round.turns.length < @number_of_cards
    puts "\nThis is card number #{@round.turns.length + 1} out of #{@number_of_cards}."
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

  if @round.turns.length == @number_of_cards
    puts "\n\n****** Game over! ******\n\n"

    guess = if @round.number_correct == 1
              'guess'
            else
              'guesses'
            end

    if @round.percent_correct >= 80
      print_slow "Congrats! You win!\n\n"
    else
      print_slow "As Willy Wonka would say...YOU LOSE!\n"
    end

    sleep 1
    puts "You had #{@round.number_correct} correct #{guess} out of #{@cards.length} for a total score of #{@round.percent_correct.to_i}% correct."
    sleep 3
    puts "\nCategories:"

    categories = @cards.map do |card|
      card.category
    end

    categories.uniq.map do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category).to_i}% correct"
    end
  end
end

play_flashcards
