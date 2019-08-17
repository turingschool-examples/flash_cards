class CardGenerator
  attr_reader :card_array

  def initialize(filename)
    @card_array  = File.open(filename).map {|line| line.split("\n") }
  end

end
