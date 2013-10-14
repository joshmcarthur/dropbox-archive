require "test_helper"

class CLITest < Test::Unit::TestCase

  def test_setup_invokes_authorization
    Dropbox::Archive::Authorization.expects(:new)
    Dropbox::Archive::CLI.new.setup
  end

  def test_monitor_invokes_monitor
    Dropbox::Archive::Monitor.expects(:new)
    Dropbox::Archive::CLI.new.monitor
  end
end