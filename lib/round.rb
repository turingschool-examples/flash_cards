class Round
require './lib/turn'

  attr_accessor :deck, :turns, :count_array,
  :category_count, :percent, :new_turn, :guesses

  def initialize(deck)
    @deck = deck
    @turns = []
    @new_turn
    @count_array = []
    @category_count = 0
    @percent
    @guesses
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guesses)
   @new_turn = Turn.new(guesses, current_card)
   @turns << @new_turn
   deck.cards.rotate!
   if @new_turn.correct?
     @count_array << @new_turn
   end
   @turns.last
  end

  def number_correct
    @count_array.size
  end

  def number_correct_by_category(category)
    @turns.each do |turn|
        if turn.card.category == category
            @category_count += 1
        end
    end
      @category_count
  end

  def percent_correct
   percent = ((100.00 / @turns.size) * @count_array.size)
   format("%.2f", percent)
  end

  def percent_correct_by_category(category)
      deck.cards_in_category(category)
      number_correct_by_category(category)

      percent = (100.00 / category_size) * @category_count
      format("%.2f", percent)
  end
  def start
   @count = 0

      puts "Welcome! You're playing with #{@deck.cards.size} cards."
      puts "______________________________________"

      while @count < @deck.cards.size
        puts "This is card number #{@turns.size + 1} out of #{@deck.cards.size}."
        puts "Question #{deck.cards.first.question}?"

        print "Guess:"
        guesses = gets.chomp.to_s
        take_turn(guesses)
        puts
        puts @new_turn.correct?
        puts @count += 1
        puts @deck.cards.size
    end
     puts "****** Game Over! ******"
     puts "You had #{number_correct} correct guesses out of #{@deck.cards.size} for a total score of #{percent_correct}%."
     puts "STEM - #{@category_percent}% correct."
     puts "Geography - #{@category_percent}% correct."
  end
end
