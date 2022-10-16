class Interface
  
  attr_reader :cards, :deck, :round

  def initialize
    @cards = CardGenerator.new("cards.txt").cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def play
    puts "Welcome! You're playing with #{@round.deck.initial_size} cards."
    puts "Answers are not case sensitive and *~some~* spelling errors are allowed."
    puts "-------------------------------------------------"


    until @round.deck.count == 0 do
      puts "This is card number #{@round.turns.length + 1} out of #{@round.deck.initial_size}."
      puts "Question: #{@round.current_card.question}"
      guess = gets.chomp
      @round.take_turn(guess)
      puts "#{@round.feedback}\n"
    end

    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guess#{@round.number_correct > 1 ? 'es' : ''} out of #{@round.deck.initial_size} for a total score of #{@round.percent_correct}%."
    @deck.category_data.keys.each {|category| puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"}
  end
end
