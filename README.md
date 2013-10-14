# Dropbox::Archive

[![Build Status](https://travis-ci.org/joshmcarthur/dropbox-archive.png?branch=master)](https://travis-ci.org/joshmcarthur/dropbox-archive) [![Code Climate](https://codeclimate.com/github/joshmcarthur/dropbox-archive.png)](https://codeclimate.com/github/joshmcarthur/dropbox-archive)

Provides the ability to 'archive' files to your Dropbox account. By 'archive', I mean upload, and then remove from your hard drive, to make the most of your Dropbox storage AND your disk space.

## Background

I have a Macbook Air, with 64gb of SSD space. While these specifications are fantastic for my everyday use, I do have some issues with keeping large files around, or large folders of files - the perfect example being photos from my camera. The idea with this gem is to provide the ability to perform a 'one-way sync' from a folder - uploading files, without requiring those files be kept locally.

This is similar to Dropbox's 'selective sync' option, but still provides the ability to upload files to the folder.


## Installation

The gem should be installed where you can get to it outside of a gemset or otherwise, especially if you wish to run it as a background process.

If you are using system ruby or rbenv, then you should just be able to:

	$ gem install dropbox-archive

If you are using RVM, then you may wish to use a wrapper:

	$ rvm use default
	$ gem install dropbox-archive
	$ rvm wrapper default dropbox-archive --no-prefix

    
## Configuration

At the moment, configuration is a four-step process - I'm hoping to streamline this process in the near future, as the configuration so far has been a bit build-as-you-go.

1. Create a file in your home folder, called ".dropbox_archive"
2. Go to the [Dropbox Developer Center](https://dropbox.com/developers/apps) and create an application for yourself. This is needed to perform OAuth login, which Dropbox requires for API authentication.
3. Run `dropbox-archive setup` for a link to acquire an access token from Dropbox. When this process is complete, you should see a welcome message, with your name, and your access token will have been saved in your settings. If you see an error, lodge an issue, and I'll help you out.
4. Open up your `~/.dropbox_archive` file, and add a setting called `directory` that has the full path of the directory you want to watch. When files are added to this directory, they will be uploaded to Dropbox and then deleted from your local filesystem. 

Once the configuration is done once, it should just continue working as long as you need it to, but if you need to re-generate your access token, then just run `dropbox-archive setup` again. I do appreciate that configuration isn't too easy right now, and plan to integrate many of these steps into the `setup` command.


## Usage

Simply run `dropbox-archive monitor` to begin monitoring the directory you configured in your settings file. Try creating a file in this directory - after a couple of seconds you should receive a notification that the file has been uploaded to Dropbox, and the file will have been removed from local storage.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
