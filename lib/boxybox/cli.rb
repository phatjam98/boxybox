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
  end
end
