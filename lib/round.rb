#if had time to refactor, would use more
#string interpolation in all of round.rb file

class Round
  attr_reader :deck, :turns, :turn_counter, :number_correct, :pop_correct, :stem_correct, :geo_correct, :turing_correct
  def initialize(deck)
    @deck = deck
    @turn_counter = 0
    @turns = []
    @number_correct = 0
    @stem_correct = []
    @geo_correct = []
    @turing_correct = []
    @pop_correct = []
  end

  def current_card
    deck.cards[@turn_counter]
  end



  def take_turn(guess)

    if guess == current_card.answer
      @number_correct +=1
    end

    deck.cards.each do |card|
      if card.answer == guess && card.category == :Geography
        @geo_correct << card
      elsif card.answer == guess && card.category == :STEM
        @stem_correct << card
      end
    end

    turn = Turn.new(guess, current_card)
    @turns << turn
    @turn_counter += 1
    return turn
  end

  def number_correct_by_category(category)
    if category == :STEM
      @stem_correct.count
    elsif category == :Geography
      @geo_correct.count
    end
  end

  def percent_correct
     number_correct.to_f / @turns.count.to_f * 100
  end

  def percent_correct_by_category(category)
    if category == :Geography
      (@geo_correct.count / deck.geography_cards.count).to_f * 100.0
      elsif category == :STEM
      (@stem_correct.count / deck.stem_cards.count).to_f * 100.0
    end
  end

  def start
      puts "Welcome! You're playing with #{deck.count} cards."
      puts "-------------------------------------------------"
      puts "This is card number 1 out of #{deck.count}." #refactor later
      puts "Question: #{deck.cards[0].question}"

      guess_1 = gets.to_i

      if guess_1 == deck.cards[0].answer
        p "Correct!"
        @stem_correct << guess_1
      elsif guess_1 != deck.cards[0].answer
        p "Incorrect."
      end

      puts "This is card number 2 out of #{deck.count}."
      puts "Question: #{deck.cards[1].question}"

      guess_2 = gets.to_s.chomp!

      if guess_2 == "cat"
        p "Correct!"
        @turing_correct << guess_2
      else
        p "Incorrect."
      end

      puts "This is card number 3 out of #{deck.count}."
      puts "Question: #{deck.cards[2].question}"

      guess_3 = gets.to_s.chomp!

      if guess_3 == deck.cards[2].answer
        p "Correct!"
        @turing_correct << guess_3
      else
        p "Incorrect."
      end

      puts "This is card number 4 out of #{deck.count}."
      puts "Question: #{deck.cards[3].question}"

      guess_4 = gets.to_s.chomp!

      if guess_4 == deck.cards[3].answer
        p "Correct!"
        @pop_correct << guess_4
      else
        p "Incorrect."
      end

      puts "****** Game over! ******"
      puts "You had #{stem_correct.count + pop_correct.count + geo_correct.count + turing_correct.count} correct guesses out of #{deck.count} for a total score of 75%"
      puts "STEM - 100% correct"
      puts "Turing Staff - 50% correct"
      puts "Pop Culture - 100% correct"
      #refactor these to string interpolation
    end
  end
