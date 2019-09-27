dev-setup
============

## Motivation

Setting up a new developer machine can be an **ad-hoc, manual, and time-consuming** process.  `dev-setup` aims to **simplify** the process with **easy-to-understand instructions** and **dotfiles/scripts** to **automate the setup**.

## Sections Summary
* Section 1 contains the dotfiles/scripts and instructions to set up your system.
* Sections 2 through 7 detail more information about installation, configuration, and usage for topics in Section 1.

## Section 1: Installation

**Scripts tested on OS X 10.10 Yosemite and 10.11 El Capitan.**

* [Single Setup Script](#single-setup-script)
* [bootstrap.sh script](#bootstrapsh-script)
    * Syncs dev-setup to your local home directory `~`
* [osxprep.sh script](#osxprepsh-script)
    * Updates OS X and installs Xcode command line tools
* [brew.sh script](#brewsh-script)
    * Installs common Homebrew formulae and apps
* [osx.sh script](#osxsh-script)
    * Sets up OS X defaults geared towards developers
* [web.sh script](#websh-script)
    * Sets up JavaScript web development

## Section 2: General Apps and Tools

* [Sublime Text](#sublime-text)
* [iTerm2](#iterm2)
* [Git](#git)
* [Homebrew](#homebrew)
* [Heroku](#heroku)

## Section 6: JavaScript Web Development

* [Node.js](#nodejs)

* [Credits](#credits)
* [License](#license)

## Section 1: Installation

### Single Setup Script

#### Running with Git

##### Clone the Repo

    $ git clone https://github.com/donnemartin/dev-setup.git && cd dev-setup

##### Run the .dots Script with Command Line Arguments

**Since you probably don't want to install every section**, the `.dots` script supports command line arguments to run only specified sections.  Simply pass in the [scripts](#scripts) that you want to install.  Below are some examples.

**For more customization, you can [clone](#clone-the-repo) or [fork](https://github.com/donnemartin/dev-setup/fork) the repo and tweak the `.dots` script and its associated components to suit your needs.**

Run all:

    $ ./.dots all

Run `bootstrap.sh`, `osxprep.sh`, `brew.sh`, and `osx.sh`:

    $ ./.dots bootstrap osxprep brew osx

Run `bootstrap.sh`, `osxprep.sh`, `brew.sh`, and `osx.sh`, `pydata.sh`, `aws.sh`, and `datastores.sh`:

    $ ./.dots bootstrap osxprep brew osx pydata aws datastores

#### Running without Git

    $ curl -O https://raw.githubusercontent.com/donnemartin/dev-setup/master/.dots && ./.dots [Add ARGS Here]

#### Scripts

* [.dots](https://github.com/donnemartin/dev-setup/blob/master/.dots)
    * Runs specified scripts
* [bootstrap.sh](https://github.com/donnemartin/dev-setup/blob/master/bootstrap.sh)
    * Syncs dev-setup to your local home directory `~`
* [osxprep.sh](https://github.com/donnemartin/dev-setup/blob/master/osxprep.sh)
    * Updates OS X and installs Xcode command line tools
* [brew.sh](https://github.com/donnemartin/dev-setup/blob/master/brew.sh)
    * Installs common Homebrew formulae and apps
* [osx.sh](https://github.com/donnemartin/dev-setup/blob/master/osx.sh)
    * Sets up OS X defaults geared towards developers
* [web.sh](https://github.com/donnemartin/dev-setup/blob/master/web.sh)
    * Sets up JavaScript web development

**Notes:**

* `.dots` will initially prompt you to enter your password.
* `.dots` might ask you to re-enter your password at certain stages of the installation.
* If OS X updates require a restart, simply run `.dots` again to resume where you left off.
* When installing the Xcode command line tools, a dialog box will confirm installation.
    * Once Xcode is installed, follow the instructions on the terminal to continue.
* `.dots` runs `brew.sh`, which takes awhile to complete as some formulae need to be installed from source.
* **When `.dots` completes, be sure to restart your computer for all updates to take effect.**

I encourage you to read through Section 1 so you have a better idea of what each installation script does.  The following discussions describe in greater detail what is executed when running the [.dots](https://github.com/donnemartin/dev-setup/blob/master/.dots) script.

### bootstrap.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/commands.png">
  <br/>
</p>

The `bootstrap.sh` script will sync the dev-setup repo to your local home directory.  This will include customizations for Vim, bash, curl, git, tab completion, aliases, a number of utility functions, etc.  Section 2 of this repo describes some of the customizations.

#### Running with Git

First, fork or [clone the repo](#clone-the-repo).  The `bootstrap.sh` script will pull in the latest version and copy the files to your home folder `~`:

    $ source bootstrap.sh

To update later on, just run that command again.

Alternatively, to update while avoiding the confirmation prompt:

    $ set -- -f; source bootstrap.sh

#### Running without Git

To sync dev-setup to your local home directory without Git, run the following:

    $ cd ~; curl -#L https://github.com/donnemartin/dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE}

To update later on, just run that command again.

#### Optional: Specify PATH

If `~/.path` exists, it will be sourced along with the other files before any feature testing (such as detecting which version of `ls` is being used takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

#### Optional: Add Custom Commands

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
GIT_AUTHOR_NAME="Donne Martin"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="donne.martin@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# Install or upgrade a global package
# Usage: gpip install –upgrade pip setuptools virtualenv
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
```

You could also use `~/.extra` to override settings, functions, and aliases from the dev-setup repository, although it’s probably better to [fork the dev-setup repository](https://github.com/donnemartin/dev-setup/fork).

### osxprep.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/xcode.jpg">
  <br/>
</p>

Run the `osxprep.sh` script:

    $ ./osxprep.sh

`osxprep.sh` will first install all updates.  If a restart is required, simply run the script again.  Once all updates are installed, `osxprep.sh` will then [Install Xcode Command Line Tools](#install-xcode-command-line-tools).

If you want to go the manual route, you can also install all updates by running "App Store", selecting the "Updates" icon, then updating both the OS and installed apps.

#### Install Xcode Command Line Tools

An important dependency before many tools such as Homebrew can work is the **Command Line Tools for Xcode**. These include compilers like gcc that will allow you to build from source.

If you are running **OS X 10.9 Mavericks or later**, then you can install the Xcode Command Line Tools directly from the command line with:

    $ xcode-select --install

**Note**: the `osxprep.sh` script executes this command.

Running the command above will display a dialog where you can either:
* Install Xcode and the command line tools
* Install the command line tools only
* Cancel the install

##### OS X 10.8 and Older

If you're running 10.8 or older, you'll need to go to [http://developer.apple.com/downloads](http://developer.apple.com/downloads), and sign in with your Apple ID (the same one you use for iTunes and app purchases). Unfortunately, you're greeted by a rather annoying questionnaire. All questions are required, so feel free to answer at random.

Once you reach the downloads page, search for "command line tools", and download the latest **Command Line Tools (OS X Mountain Lion) for Xcode**. Open the **.dmg** file once it's done downloading, and double-click on the **.mpkg** installer to launch the installation. When it's done, you can unmount the disk in Finder.

### brew.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/homebrew2.png">
  <br/>
</p>

When setting up a new Mac, you may want to install [Homebrew](http://brew.sh/), a package manager that simplifies installing and updating applications or libraries.

Some of the apps installed by the `brew.sh` script include: Chrome, Firefox, Sublime Text, Atom, Dropbox, Evernote, Skype, Slack, Alfred, VirtualBox, Vagrant, Docker, etc.  **For a full listing of installed formulae and apps, refer to the commented [brew.sh source file](https://github.com/donnemartin/dev-setup/blob/master/brew.sh) directly and tweak it to suit your needs.**

Run the `brew.sh` script:

    $ ./brew.sh

The `brew.sh` script takes awhile to complete, as some formulae need to be installed from source.

**For your terminal customization to take full effect, quit and re-start the terminal**

### osx.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/osx.png">
  <br/>
</p>

When setting up a new Mac, you may want to set OS X defaults geared towards developers.  The `osx.sh` script also configures common third-party apps such Sublime Text and Chrome.

**Note**: **I strongly encourage you read through the commented [osx.sh source file](https://github.com/donnemartin/dev-setup/blob/master/osx.sh) and tweak any settings based on your personal preferences.  The script defaults are intended for you to customize.**  For example, if you are not running an SSD you might want to change some of the settings listed in the SSD section.

Run the `osx.sh` script:

    $ ./osx.sh

**For your terminal customization to take full effect, quit and re-start the terminal.**



### web.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/webdev.png">
  <br/>
</p>

To set up a JavaScript web development environment, Run the `web.sh` script:

    $ ./web.sh

[Section 6: Web Development](#section-6-web-development) describes the installed packages and usage.

## Section 2: General Apps and Tools

### iTerm2

## Section 6: Web Development

### Node.js

## Section 8: Misc

### Contributions

Bug reports, suggestions, and pull requests are [welcome](https://github.com/donnemartin/dev-setup/issues)!

### Credits

See the [Credits Page](https://github.com/donnemartin/dev-setup/blob/master/CREDITS.md).

## Contact Info

Feel free to contact me to discuss any issues, questions, or comments.

My contact info can be found on my [GitHub page](https://github.com/donnemartin).

### License

This repository contains a variety of content; some developed by Donne Martin, and some from third-parties.  The third-party content is distributed under the license provided by those parties.

The content developed by Donne Martin is distributed under the following license:

*I am providing code and resources in this repository to you under an open source license.  Because this is my personal repository, the license you receive to my code and resources is from me and not my employer (Facebook).*

    Copyright 2015 Donne Martin

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
