require './lib/card'

class CardGenerator
  def file_reader
    file = File.open("./resources/cards.txt")
    cards = make_cards(file)
    file.close
    cards
  end

  def make_cards(file)
    raw_cards = file.read.split("\n")
    raw_cards.map do |card|
      process_card(card)
    end
  end

  def process_card(card)
    question, answer, category = card.split(",")
    category = format_category(category)

    create_card(question, answer, category)
  end

  def format_category(category)
    if category.count(" ") >= 1
      category = category.split
      formatted = category.join("_")
    else
      formatted = parse_category(category)
    end
    formatted.to_sym
  end

  def parse_category(category)
    words = category.scan(/[A-Z][a-z]+/)
    words.size >= 1 ? words.join("_") : category
  end

  def create_card(question, answer, category)
    Card.new(question, answer, category)
  end
end

CardGenerator.new.file_reader
