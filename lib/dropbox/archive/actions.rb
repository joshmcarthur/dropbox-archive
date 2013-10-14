module Dropbox
  module Archive
    module Actions

      def upload(path)
        file = File.open(path)
        Dropbox::Archive.client.put_file(File.basename(path), file)
        remove(path)
      end

      def remove(path)
        FileUtils.rm(path)
      end
    end
  end
end