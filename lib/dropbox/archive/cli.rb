class Dropbox::Archive::CLI < Thor
  desc "setup", "setup client"
  def setup
    Dropbox::Archive::Authorization.new
  end

  desc "monitor", "start monitoring folder"
  def monitor
    Dropbox::Archive::Monitor.new
  end
end