require 'thor'

module Ryp
  class Command < Thor

    desc 'info <argument>', "Look up related information to any given argument"
    option :network, aliases: :n
    option :verbose, type: :boolean, aliases: :v
    def info(argument)
      Ryp.info(argument, options)
    end

    desc 'status', 'Report current status across all networks'
    def status
      puts 'Network Status: Not implemented yet'
    end

    default_command :info
  end
end
