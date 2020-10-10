class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    lines = File.readlines(filename)
    lines.each do |line|
      temp_array = line.split(",")
      q = temp_array[0]
      a = temp_array[1]
      s = temp_array[2]

      s = s.chomp.delete(" ").to_sym

      @cards << Card.new(q, a, s)

    end
    # puts @cards
  end

end
