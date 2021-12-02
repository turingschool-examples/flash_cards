

class CardGenerator
  attr_accessor :filename, :cards

  def initialize(filename)
    @filename = filename
    File.open("lib/#{filename}", "r") do |file|
      puts file.readline()
    end
    @cards = []
  end
end


#filename = "cards.txt"
#generator = CardGenerator.new(filename)
