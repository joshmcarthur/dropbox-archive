module Dropbox
  module Archive
    class Authorization

      def initialize
        DropboxOAuth2FlowNoRedirect.new(
          Dropbox::Archive.config.get("dropbox_app_key"),
          Dropbox::Archive.config.get("dropbox_app_secret")
        end.tap do |flow|
          authorize_url = flow.start

          puts "Please authorize this application at: #{authorize_url}"
          puts "Enter authorization code:"
          authorization_code = gets.chomp

          access_token, user_id = flow.finish(authorization_code)
          Dropbox::Archive.config.set("dropbox_access_token", access_token)
        end
      end
    end
  end
end