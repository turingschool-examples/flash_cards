class Turn
attr_reader :string, :card
  def initialize string, card
    @string = string
    @card = card
  end

  def guess()
    guess = gets.chomp
  end

end


guess = gets
guess
