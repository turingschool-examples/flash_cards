class CardGenerator
  def initialize(filename)
    @filename = filename
    @list_cards = []
  end

  def cards
    File.foreach(@filename).map do |line|
      line.split(",").each.with_index do |item, idx|
        case (idx % 3)
        when 1
          ""
        when 2
          ""
        when 3
          ""
        end
      end
    end
  end
end