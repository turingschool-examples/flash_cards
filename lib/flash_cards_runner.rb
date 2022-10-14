require './card'

require './turn'

require './deck'

require './round'

require './card_generator'

input_file = "./cards.txt"

cards = CardGenerator.new(input_file).cards_inputted

deck = Deck.new(cards)

$round = Round.new(deck)

$round_count = $round.deck.count

def start
  @categories_played = []
  puts "Welcome! You are playing with #{$round_count} cards."
  puts '--------------------------------------------------'
  $round_count.times do
    puts "This is card number #{$round.card_number} out of #{$round_count}."
    puts "Question: #{$round.current_card.question}"

    unless @categories_played.include?($round.current_card.category)

      @categories_played << $round.current_card.category
    end
    
    $round.take_turn(gets.chomp)
    puts $round.turns.last.feedback


  end
  puts '****** Game over! ******'
  puts "You had #{$round.number_correct.to_i} guesses out of #{$round_count.to_i} for a total score of #{$round.percent_correct.to_i}%."


  
  @categories_played.each do |category_played|
    puts "#{category_played} - #{$round.percent_correct_by_category(category_played)}% correct."
  end

end


start


