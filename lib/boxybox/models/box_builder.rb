# frozen_string_literal: true

# @author Travis Carter
# helper methods to create and merge terminal boxes
class BoxBuilder
  SPACE = ' '

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
