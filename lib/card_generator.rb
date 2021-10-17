require './lib/card'

class CardGenerator
  attr_accessor :cards_generator_array

  def initialize(text_file)
    array = []
    File.open(text_file, 'r') do |file|
      for line in file.readlines()
        array << line.chomp
      end

    end
    new_array = []
    array.each do |item|
      new_array << item.split(',')
    end

    @cards_generator_array = []
    new_array.each do |text_array|
      @cards_generator_array << Card.new(text_array[0],text_array[1], text_array[2])
    end
  end

end
