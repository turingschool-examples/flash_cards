require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class Game

  def initialize(deck)
    @deck = deck
    @category_names_final = []
    @categories_percent_correct = []
  end


  def unique_categories_mod
    @all_categories = @round.deck.cards.collect {|card| card.category}
    @unique_categories = @all_categories.uniq
    @category_string_names = @unique_categories.collect {|category| category.to_s}
    @category_names_final = @category_string_names.collect {|category_upcase| category_upcase.upcase}
  end

  def categories_percent_correct
    @categories_percent_correct = @unique_categories.collect { |category_percent|
      @round.percent_correct_by_category(category_percent)
    }
  end

  def guess_card
    @player_guess = gets.chomp
    @round.take_turn(@player_guess)
  end

  def answer_all_cards
    while @round.current_card_count < (@round.deck.cards.count) do
      puts "This is card #{@round.current_card_count + 1} of #{@round.deck.cards.count}"
      puts "Question: #{@round.deck.cards[@round.current_card_count].question}"

      guess_card

      puts (@round.turns[@round.current_card_count - 1].feedback)
    end
  end

  def print_category_percentage
    @unique_categories.each_with_index do |category, index|
      puts "#{@category_names_final[index]} - #{@categories_percent_correct[index]}% correct"
    end
  end

  def start
    @round = Round.new(@deck)
    puts "Welcome! You're playing with #{@round.deck.cards.count} cards."
    puts "--------------------------------------------------------------------"

    answer_all_cards

    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.count} for a total score of #{@round.percent_correct}%."

    unique_categories_mod
    categories_percent_correct
    print_category_percentage
  end



  # @card1 = Card.new('What is the capital of CO?', '1', :Geography)
  # @card2 = Card.new('What is the captial of Mexico?', '2', :Geography)
  # @card3 = Card.new('What is the boiling point (degrees celcius) of water?', '3', :Science)
  # @card4 = Card.new('What position did Satchel Paige play?', '4', :Sports)
  # @card5 = Card.new('What element is abbreviated as Cl?', '5', :Science)
  # @cards = [@card1, @card2, @card3, @card4, @card5]
  # @deck = Deck.new(@cards)

end
