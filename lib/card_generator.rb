require 'pry'
class CardGenerator

  attr_reader :filename, :sorted_cards

  def initialize(filename)
    @filename = filename
    @sorted_cards = []
  end

  def cards_init
    # I can totally refactor this now that I know it works, does not need all the vars
      file = File.open(@filename)
      file_read = file.read
      file_read.chomp!
      file_gsub = file_read.gsub("\n", ",")

      file_split = file_gsub.split(',')
      file_fancy = file_split.map.with_index {|v,i|
        if (i+1) % 3 == 0
        then v.to_sym
      else v.to_s
      end}
      @sorted_cards = file_fancy.each_slice(3).to_a
  end

end
