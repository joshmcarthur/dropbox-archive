require "test_helper"

class ConfigurationTest < Test::Unit::TestCase
  def setup
    @filepath = File.join(File.dirname(__FILE__), 'test.yml')
    @configuration = Dropbox::Archive::Configuration.new(@filepath)
  end

  def teardown
    FileUtils.rm(@filepath)
  end

  def test_set_key
    @configuration.set("test", "key")
    assert_equal File.read(@filepath), "---\ntest: key\n"
  end

  def test_get_key
    File.open(@filepath, 'w') { |f| f.write "---\ntest: key\n" }
    assert_equal @configuration.get("test"), "key"
  end
end