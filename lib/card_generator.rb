require 'rspec'
require 'pry'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class CardGenerator

  attr_reader :filename, :text_file_lines, :card_array

  def initialize(filename)
    @filename = filename
    @text_file_lines = []
    @card_array = []
  end

  def get_text_content

    file = File.read(filename)

    file.each_line do |line|
      @text_file_lines << line
    end

    @text_file_lines
  end

  def card_creator

    @text_file_lines.each do |line|
      card_format_array = line.split(",")
      question = card_format_array[0].chomp
      answer = card_format_array[1].chomp
      category = card_format_array[2].chomp
      @card_array << Card.new(question,answer,category)
    end

    @card_array
  end

end
