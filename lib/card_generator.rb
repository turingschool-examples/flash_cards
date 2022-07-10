require './lib/card'
class Card_Generator
  attr_reader :cards
  def initialize(filename)
    @filename = filename
    file = File.open(filename)
    file_data = file.readlines.map.each {|x| x.split(",")}
    @cards = card_maker(file_data)
  end

  def card_maker(data_arrs)
    cards = []
    data_arrs.each do |data_arr|
      cards << Card.new(data_arr[0],data_arr[1],data_arr[2])
    end
    cards
  end

end
