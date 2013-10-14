require 'listen'

module Dropbox
  module Archive
    class Monitor
      def initialize
        listener = Listen.to(Dropbox::Archive.config.get('directory')) do |modified, added, removed|
          added.each { |path| Dropbox::Archive.upload(path) }
          modified.each { |path| Dropbox::Archive.upload(path) }
        end

        listener.start
        sleep
      end
    end
  end
end