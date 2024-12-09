class Card_Generator 
  attr_reader :cards

  def initialize(filepath)
    @cards = []
    card_strings = []
    File.foreach(filepath) {|line| card_strings << line.chomp.split(',')}
    card_strings.each { |entry|
      @cards << Card.new(entry[0], entry[1], entry[2])
    }
  end

end