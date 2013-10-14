require "dropbox/archive/version"
require "dropbox/archive/actions"
require "dropbox/archive/configuration"
require "dropbox/archive/authorization"
require "dropbox/archive/cli"
require "dropbox/archive/guard"
require "dropbox/archive/monitor"

module Dropbox
  module Archive
    extend Actions

    def self.config
      @config ||= Configuration.new("~/.dropbox_archive")
    end
  end
end
