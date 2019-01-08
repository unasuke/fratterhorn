require "test_helper"
require 'time'

class FratterhornTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Fratterhorn::VERSION
  end

  def test_fratterhorn_parse_with_no_option
    markdown = <<~MD
      ---
      title: 'how to use fratterhorn'
      date: 2018-01-31 21:00 JST
      tags:
      - ruby
      - gem
      - howto
      - programming
      ---

      ## What is fratterhorn?
      - a gem
      - parse frontmatter
    MD
    result = Fratterhorn.parse(markdown)

    assert_equal 'how to use fratterhorn', result[:title]
    assert_equal '2018-01-31 21:00 JST', result[:date]
    assert_equal 'ruby', result[:tags].first
  end

  def test_fratterhorn_parse_with_guess_true
    markdown = <<~MD
      ---
      title: 'how to use fratterhorn'
      date: 2018-01-31 21:00 JST
      tags:
      - ruby
      - gem
      - howto
      - programming
      ---

      ## What is fratterhorn?
      - a gem
      - parse frontmatter
    MD
    result = Fratterhorn.parse(markdown, option: { guess: true })

    assert_equal 'how to use fratterhorn', result[:title]
    assert_equal Time.parse('2018-01-31 21:00 JST'), result[:date]
    assert_equal 'ruby', result[:tags].first
  end
end
