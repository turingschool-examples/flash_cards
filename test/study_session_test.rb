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
end
