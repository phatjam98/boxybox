# frozen_string_literal: true

require_relative '../command'
require 'boxybox/models/box_builder'

module Boxybox
  module Commands
    class Boxes < Boxybox::Command
      def initialize(input, options)
        @input = input
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        json_str = @input

        if @options['file']
          file_path = @options['file']
          json_str = IO.read(file_path)
        elsif @options['example']
          file_path = "lib/boxybox/templates/boxes/#{@options['example']}.json"
          json_str = IO.read(file_path)
          output.puts json_str if @options['print_example']
        end

        boxes = BoxBuilder.create_from_json(json_str)

        # Command logic goes here ...
        output.puts boxes
      end
    end
  end
end
