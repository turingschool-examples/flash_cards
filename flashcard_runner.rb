require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

cards = CardGenerator.new("my_cards.txt").make_cards(";")
@cards = cards.shuffle
@num_cards = @cards.length
@categories = @cards.map {|card| card.category}.uniq
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start
  puts "Welcome! You're playing with #{@deck.cards.length} cards."
  puts "_" * 50

  @num_cards.times do |index|
    puts "This is card number #{index + 1} of #{@num_cards}"
    print @round.current_card.question + "\n"
    answer = gets.chomp
    @round.take_turn(answer)
    puts @round.turns.last.feedback
    puts ""
    if index + 1 == @num_cards
      puts "****** Game over! ******"
      puts "You had #{@round.number_correct} correct answers out of #{@num_cards} for a total score of #{@round.percent_correct}%."
      @categories.each do |category|
        puts "#{category} - #{@round.percent_correct_by_category(category)} correct"
      end
    end
  end
end

start
