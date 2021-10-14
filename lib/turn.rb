class Turn

  attr_reader :string, :card, :category

  def initialize(string, card, category)
    @string = string
    @card = card
    @guess = guess
    @category = category
  end

  def guess(guess)
    guess = gets.chomp
    puts @guess
  end

  def card
    puts @card
  end

  def correct?
    if @guess == @card or @guess == @card.downcase
      puts true
    else
      puts false
  end

  def feedback
    if @guess == @card or @guess == @card.downcase
      puts "Correct. The answer is #{answer}." # where is answer coming from
    else
      puts "Incorrect. The answer is #{answer}."
    end
  end
end
