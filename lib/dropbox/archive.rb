require "dropbox/archive/version"
require "dropbox/archive/actions"
require "dropbox/archive/configuration"
require "dropbox/archive/authorization"
require "dropbox/archive/cli"
require "dropbox/archive/monitor"
require "dropbox_sdk"

module Dropbox
  module Archive
    extend Actions

    def self.config
      @config ||= Configuration.new("~/.dropbox_archive")
    end

    def self.client
      if Dropbox::Archive.config.get('dropbox_access_token').nil?
        raise "No access token configured! Please run dropbox-archive setup."
      end

      @client ||= ::DropboxClient.new(Dropbox::Archive.config.get('dropbox_access_token'))
    end
  end
end
