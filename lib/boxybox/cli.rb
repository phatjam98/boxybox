# frozen_string_literal: true

require 'thor'

module Boxybox
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'boxybox version'
    def version
      require_relative 'version'
      puts "v#{Boxybox::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'boxes [INPUT]', 'Accepts a config as defined in the README and prints ASCII boxes in the terminal'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :file, aliases: '-f', type: :string,
                         desc: 'Specify a file path to use as the input'
    method_option :example, aliases: '-e', type: :string,
                            desc: 'Select example 1 to 4',
                            banner: 'example1', enum: %w(example1 example2 example3 example4)
    method_option :print_example, aliases: '-p', type: :boolean,
                                  desc: 'Select the example json to output to terminal.'

    def boxes(input = nil)
      if options[:help]
        invoke :help, ['boxes']
      else
        require_relative 'commands/boxes'
        Boxybox::Commands::Boxes.new(input, options).execute
      end
    end
  end
end
