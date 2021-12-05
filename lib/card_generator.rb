
class CardGenerator
  attr_reader :txt

  def initialize(filename)
    @txt = File.open(filename)
  end

  def print
    apple = CSV.parse(File.read(filename), headers: false)
  end

end


# input_cards = File.new(cards, 'r')
# content = input_cards.sysread(20)
# txt = open(filename)
# puts "Here's your file #{filename}:"
# print txt.read
