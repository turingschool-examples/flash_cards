class Game

  def initialize
    @card_1 = Card.new("What is 5 + 5?", "10", "STEM")
    @card_2 = Card.new("What is Rachels favorite animal?", "toad", "Turing Staff")
    @card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
    @card_4 = Card.new("What cardboard cutout lives at Turing", "Justin Bieber", "Pop Culture")
    @cards = [@card_1, @card_2, @card_3, @card_4]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    @turn = 1
    @game = self
    @guess = ""
  end

  def start
    message
  end

  def message
    if @turn == 1
      puts "Welcome! You're playing with #{@deck.cards.count} cards."
      puts "-------------------------------------------------"
      puts "This is card number #{@turn} out of #{@cards.count}."
      puts @cards[@turn -1 ].question
      @turn += 1
      new_turn
    elsif @turn <= @cards.count
      puts "#{@round.turns.last.feedback}"
      puts "This is card number #{@turn} out of #{@cards.count}."
      puts @cards[@turn -1 ].question
      @turn += 1
      new_turn
    else
      puts "#{@round.turns.last.feedback}"
      puts "****** Game over! ******"
    end
  end

  def new_turn
    @guess = gets.chomp
    @round.take_turn(@guess, @game)
  end


end
