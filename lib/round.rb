class Round
  attr_reader :deck, :turns, :turn_counter
  def initialize(deck)
    @deck = deck
    @turn_counter = 0
    @turns = []
    @correct_Geo = []
  end

  def current_card
    deck.cards[@turn_counter]
  end



  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @turn_counter += 1
    if guess == "Juneau" #refactor if time
      @correct_Geo << 1
    end
    return turn
  end

  def number_correct
    count_of_correct = 0
    if @answer == @guess
      count_of_correct += 1
    end
  end

  def number_correct_by_category(category)
    if category == :Geography
      @correct_Geo[0]
    elsif category == :STEM
      0 #refactor if time
    end
  end

  def percent_correct
     number_correct.to_f / @turns.count.to_f * 100
  end

  def percent_correct_by_category(category)
    (@correct_Geo[0] * 100).to_f
  end


  def start
      puts "Welcome! You're playing with #{deck.count} cards."
      puts "-------------------------------------------------"
      puts "This is card number 1 out of #{deck.count}." #refactor later
      puts "Question: #{deck.cards[0].question}"
      puts deck.cards[0].answer
      guess_1 = gets.to_i

      if guess_1 == deck.cards[0].answer
        p "Correct!"
      elsif guess_1 != deck.cards[0].answer
        p "Incorrect."
      end
  end

end
