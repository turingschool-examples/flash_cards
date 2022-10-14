require './card'

require './turn'

require './deck'

require './round'

card_1 = Card.new("What is your name?", "Sir Lancelot of Camelot", :Personal)

card_2 = Card.new("What is your quest?", "To seek the Holy Grail", :Personal)

card_3 = Card.new("What is your favorite color?", "Blue", :Personal)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

$round = Round.new(deck)

$round_count = $round.deck.count

def start
  @categories_played = []
  puts "Stop! He who approacheth the Bridge of Death must answer me these questions #{$round_count}, ere the other side he see"
  puts '--------------------------------------------------'
  $round_count.times do
    puts "#{$round.current_card.question}"

    unless @categories_played.include?($round.current_card.category)

      @categories_played << $round.current_card.category
    end
    
    $round.take_turn(gets.chomp)

    if 
      $round.turns.last.feedback == "Incorrect."
      puts "You have been cast into the Gorge of Eternal Peril!"
      return

    end


  end
  puts 'You may cross the bridge.'


end


start