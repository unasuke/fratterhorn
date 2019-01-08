# frozen_string_literal: true
require 'time'
require 'yaml'

module Fratterhorn
  FRONTMATTER_PATTERN = %r[^---+\n*$(.*\n)*^---+\n$]

  def self.parse(text, option: {})
    @text = text
    @option = option
    @raw_frontmatter = ''

    @raw_frontmatter = get_frontmatter
    @frontmatter = YAML.safe_load(@raw_frontmatter).transform_keys!(&:to_sym)
    guess_value_type if @option.dig(:guess)

    @frontmatter
  end

  private

  def self.get_frontmatter
    FRONTMATTER_PATTERN.match(@text).to_a.first
  end
  private_class_method :get_frontmatter

  def self.guess_value_type
    @frontmatter.each do |key, value|
      case key
      when :date, :time, :datetime
        @frontmatter[key] = Time.parse(value)
      end
    end
  end
  private_class_method :guess_value_type
end
