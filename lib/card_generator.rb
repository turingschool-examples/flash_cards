require 'pry'

class CardGenerator
  def initialize(filename)
    @filename = filename
    @list_cards = []
  end

  def cards
    File.foreach(@filename).map do |line|
      Card.new(line.split(",")[0].chomp,
               line.split(",")[1].chomp,
               line.split(",")[2].chomp)
    end
  end
end
