require 'pry'
class CardGenerator

  attr_reader :filename, :sorted_cards

  def initialize(filename)
    @filename = filename
    @sorted_cards = []
  end

  def cards_init
      file = File.open(@filename)
      file_read = file.read
      file_read.chomp!
      file_gsub = file_read.gsub("\n", ",")
      file_split = file_gsub.split(',')
      file_to_sym = file_split.select.with_index {|_,x| x % 3 == 0}

      binding.pry
      @sorted_cards = file_split.each_slice(3).to_a
  end

end
