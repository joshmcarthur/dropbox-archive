require "test_helper"

class ActionsTest < Test::Unit::TestCase
  def setup
    @test_file_path = File.join(File.dirname(__FILE__), 'fixtures', 'test.txt')
    add_test_file!
    setup_config!

    @test_file = File.open(@test_file_path)
  end

  def test_upload_file
    Dropbox::Archive.client
    .expects(:put_file)
    .with("test.txt", instance_of(File))

    assert_equal @test_file_path,
                 Dropbox::Archive.upload(@test_file)
  end

  def test_remove_file
    assert File.exists?(@test_file_path)


  end

  def add_test_file!
    FileUtils.touch(@test_file_path)
  end

  def setup_config!
    @filepath = File.join(File.dirname(__FILE__), 'fixtures', 'test_config.yml')
    Dropbox::Archive.config_path = @filepath
    Dropbox::Archive.config
  end
end