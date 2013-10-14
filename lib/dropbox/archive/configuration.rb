module Dropbox
  module Archive
    class Configuration

      attr_accessor :config_path, :config_cache

      def initialize(config_path)
        @config_path = config_path
      end

      def get(key)
        load
        config_cache[key]
      end

      def set(key, value)
        load
        config_cache[key] = value
        save
        value
      end

      private

      def load
        if !File.exists?(File.expand_path(config_path))
          FileUtils.touch(File.expand_path(config_path))
        end

        self.config_cache = YAML.load_file(File.expand_path(config_path)) || {}
      end

      def save
        load unless config_cache
        File.open(File.expand_path(config_path), 'wb') do |f|
          f.write config_cache.to_yaml
        end
      end
    end
  end
end