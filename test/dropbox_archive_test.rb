require "test_helper"

class DropboxArchiveTest < Test::Unit::TestCase
  def setup
    setup_config!
  end

  def test_load_config
    config = Dropbox::Archive.config
    assert_not_nil config.get('directory')
    assert_equal config, Dropbox::Archive.config
  end

  def test_client_access_token_not_present
    Dropbox::Archive.config.stubs(get: nil)
    assert_raise RuntimeError do
      Dropbox::Archive.client
    end
  end

  def test_client_instantiated
    DropboxClient.expects(:new)
    # Make sure client has not already been set,
    # since the value is cached
    Dropbox::Archive.instance_variable_set("@client", nil)
    Dropbox::Archive.client
  end

  private

  def setup_config!
    @filepath = File.join(File.dirname(__FILE__), 'fixtures', 'test_config.yml')
    Dropbox::Archive.config_path = @filepath
  end

end