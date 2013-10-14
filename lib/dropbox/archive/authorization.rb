require 'dropbox_sdk'

module Dropbox
  module Archive
    class Authorization

      def initialize
        DropboxOAuth2FlowNoRedirect.new(
          Dropbox::Archive.config.get("dropbox_app_key"),
          Dropbox::Archive.config.get("dropbox_app_secret")
        ).tap do |flow|
          authorize_url = flow.start

          puts "Please authorize this application at: #{authorize_url}"
          puts "Enter authorization code:"
          authorization_code = $stdin.gets.chomp

          access_token, user_id = flow.finish(authorization_code)
          Dropbox::Archive.config.set("dropbox_access_token", access_token)
        end

        puts "Welcome, #{Dropbox::Archive.client.account_info['display_name']}!"
        Dropbox::Archive.client
      end
    end
  end
end