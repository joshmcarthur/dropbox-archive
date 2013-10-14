module Dropbox
  module Archive
    module Actions

      def upload(path)
        file = File.open(path)
        Dropbox::Archive.client.put_file(File.basename(path), file)
        return remove(file)
      end

      def remove(file)
        FileUtils.rm(file)
        return File.path(file)
      end
    end
  end
end