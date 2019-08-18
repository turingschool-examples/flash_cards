require 'pry'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

@generator = CardGenerator.new("./data/cards.txt")
@generator.make_card
@cards = @generator.cards
@random_cards = []
puts "How many cards would you like? (Max is #{@cards.count})"
@userchoice = gets.chomp.to_i
def randomize_cards
  until @random_cards.count == @userchoice
    sampled_card = @cards.sample
    found_card = @random_cards.find{|card| card == sampled_card}
    if sampled_card == found_card
      @cards.delete(sampled_card)
    else
      @random_cards << sampled_card
    end
  end
end
@userchoice.times {randomize_cards}
@deck = Deck.new(@random_cards)
@round = Round.new(@deck)

 def start
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
  puts "You had #{@round.number_correct} out of #{@round.turns.count} correct for a total score of #{@round.percent_correct.round(2)}%"
  @category_collection = []
  @round.deck.recall_cards.each do |card|
    find_category = @category_collection.find_all {|cat| cat.split(" -")[0].to_sym == card.category}
    conv_find_category = nil
    if find_category.count >= 1
      conv_find_category = find_category[0].split(" -")[0].to_sym
    end
    if card.category == conv_find_category
    else
      cat_card = "#{card.category.to_s} - #{@round.percent_correct_by_category(card.category).round(2)}"
      @category_collection << cat_card
    end
  end
  @category_collection.each do |collect|
    puts collect
  end
  puts ""
 end
start
