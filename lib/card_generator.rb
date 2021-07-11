require './lib/card'


class CardGenerator
  attr_reader :filename, :new_cards

  def initialize(filename)
    @filename = filename
    @new_cards = []
  end

  def read_file
    file = File.open(@filename)
    file_data = file.readlines.map{|line| line.chomp}
    file.close
    return file_data
  end

  def input_formatter
    read_file.map {|line| line.split(",")}
  end

  def make_cards
    x = 0
    while x != input_formatter.length
      category = input_formatter[x][2]
      answer = input_formatter[x][1]
      question = input_formatter[x][0]

      @new_cards << card = Card.new(question, answer, category)
      x += 1
    end
    @new_cards
  end
end
