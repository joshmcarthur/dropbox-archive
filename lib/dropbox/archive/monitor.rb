module Dropbox
  module Archive
    class Monitor
      def initialize
        Guard.start(guardfile_contents: construct_guardfile)
        Process.daemonize
      end

      private

      def construct_guardfile
        <<-EOF
          guard 'dropbox-archive' do
            watch(#{Dropbox::Archive.config.get('directory')})
          end
        EOF
      end
    end
  end
end