require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

def game
  card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
  card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
  card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
  card_4 = Card.new('What is 5 + 5?', '10', :Math)
  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)
end

def start
  @game = game
  card_count = 1
  @cards_used = []
  p "Welcome! You're playing with #{game.deck.count} cards."

game.deck.count.times do
  p "-------------------------------------------------"
  p "This is card number #{card_count} out of #{@game.deck.count}"
  card_count += 1
  p "Question: #{@game.current_card.question}"

  unless @cards_used.include? (@game.current_card.category)
    @cards_used << @game.current_card.category
  end

  player_answer = gets.chomp
  result = @game.take_turn(player_answer)
  p "#{result.feedback}"
end

  p "****** Game over! ******"
  p "You had #{@game.number_correct} correct guesses out of #{@game.deck.count} for a total score of #{@game.percent_correct.to_i}%"

  @cards_used.each do |used|
    puts "#{used} - #{@game.percent_correct_by_category(used).to_i}% correct"

  end
end
start
