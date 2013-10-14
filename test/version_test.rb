require "test_helper"

class VersionTest < Test::Unit::TestCase
  def test_version_defined
    assert_not_nil Dropbox::Archive::VERSION
  end
end
