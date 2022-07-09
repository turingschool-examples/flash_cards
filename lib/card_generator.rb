class CardGenerator

  def initialize(filename)
    @filename = filename
  end
  def cards
      card_info_array = File.read(@filename).split("\n")
      card_info_array.map do |info|
        info_array = info.split(",")
        Card.new(info_array[0], info_array[1], info_array[2].to_sym)
      end
  end



end
