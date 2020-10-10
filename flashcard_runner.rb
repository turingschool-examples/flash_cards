require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require "./lib/study_session"
require './lib/card_generator'


filename = './lib/cards.txt'
study_session = StudySession.new(filename)
study_session.start
