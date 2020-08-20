# frozen_string_literal: true

require 'json'
require 'tty-box'

# @author Travis Carter
# helper methods to create and merge terminal boxes
class BoxBuilder
  SPACE = ' '

  attr_accessor :direction, :children, :content

  # @param [Object] config
  # @return [BoxBuilder] new instance of BoxBuilder
  def initialize(config)
    @direction = config['direction']
    @children = config['children']
    @content = config['content']
  end

  # This kicks off the parsing of the input JSON and returns the nested boxes as a string
  # @param [JSON] json_string input to create boxes
  # @return [String] will return a multiline string of ascii boxes
  def self.create_from_json(json_string)
    config = JSON.parse(json_string)
    box_builder = BoxBuilder.new(config['boxes'])

    box_builder.create_boxes
  end

  # This is the recursive method that craws down the tree to create the boxes
  # @return [Strings]
  def create_boxes
    unless @children.nil?
      child_boxes = []

      children.each { |child| child_boxes << BoxBuilder.new(child).create_boxes }

      @content = if child_boxes.length > 1 && direction == 'horizontal'
                   BoxBuilder.merge_boxes(*child_boxes)
                 else
                   child_boxes.join("\n")
                 end
    end

    @content = make_box(@content)
  end

  # Wrapper around the TTY::Box module.  This will be a prime target for expanded style choices and using more of the
  # customizations available within the TTY gem set
  # @return [Strings] ascii box
  def make_box(content)
    TTY::Box.frame(content, padding: 1, border: :ascii)
  end

  # @param [Array] box_strings boxes to be merged
  # @return [String]
  def self.merge_boxes(*box_strings)
    box_arrays = {}
    max_rows = 0
    new_box = []

    box_strings.each_with_index do |box, idx|
      box_arrays[idx] = box.split("\n")

      max_rows = max_rows > box_arrays[idx].length ? max_rows : box_arrays[idx].length
    end

    max_rows.times do |x|
      new_line = ''
      box_arrays.each_value { |box| new_line += box[x].nil? ? SPACE * box.first.length : box[x] }

      new_box << new_line
    end

    new_box.join("\n")
  end
end
