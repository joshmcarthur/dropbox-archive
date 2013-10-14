module Dropbox
  module Archive
    class Guard < Guard::Guard
      def run_on_changes(paths)
        paths.each { |path| Dropbox::Archive.upload(path) }
      end
    end
  end
end