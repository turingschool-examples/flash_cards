class Turn
  attr_reader :string, :card

  def initialize (string, card)
    @string = string
    @card = card
  end

  def guess
    puts "#{string}"
  end

  def card
    puts "#{card}"
  end

  def correct?
      @string == @card
  end

  def feedback
    if @string == @card
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

end

Turn.new("Juneau", "Juneau")
