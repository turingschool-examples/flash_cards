require "./lib/card"

class CardGenerator
    attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def manage_file
    file = File.readlines(@filename)
    file.reduce([]) do |lines, line|
      single_line = line.chomp.split("")
      lines << Card.new(single_line[0].strip, single_line[1].strip, single_line[2].strip.to_sym)
    end
  end
end
