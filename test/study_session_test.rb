require "minitest/autorun"
require "minitest/pride"
require "./lib/study_session"
require "./lib/round"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"

class StudySessionTest < Minitest::Test
  def setup
    @study_session = StudySession.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of StudySession, @study_session
  end

  def test_welcome_message
    expected = "Welcome! You're playing with 5 cards.\n" +
     "-------------------------------------------------"

    assert_equal expected, @study_session.welcome_message
  end

  def test_it_can_find_categories
    assert_equal [:German, :Spanish, :Portuguese], @study_session.find_categories
  end
end
