require 'pry'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

@generator = CardGenerator.new("./data/cards.txt")
@generator.make_card
@cards = @generator.cards
@deck = Deck.new(@cards)
@round = Round.new(@deck)

 def start
   @category_collection = []
   @cards.each do |card|
     # if  card.category == @category_collections.find {|collect| card.category}
     # else
       cat_card = "#{card.category.to_s} - #{@round.percent_correct_by_category(card.category)}"
       @category_collection << cat_card
       binding.pry
     # end
   end
  puts ""
  puts "Welcome you're playing with #{@round.deck.count} cards."
  puts "-------------------------------------------------------"
  while @round.deck.count > 0 do
    puts "This #{1 + @round.turns.count} out of #{@round.turns.count + @round.deck.count}"
    puts "Question: #{@round.deck.cards[0].question}"
    answer = gets.chomp
    @round.take_turn(answer)
    puts "#{@round.turns.last.feedback}"
    puts ""
  end
  puts "******** GAME OVER ********"
  puts "You had #{@round.number_correct} out of #{@round.turns.count} correct for a total score of #{@round.percent_correct}%"
  @category_collection.each do |collect|
    puts collect
  end
  puts ""
 end
start
