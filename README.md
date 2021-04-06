# README

This project is for:
> Kaisen Linux | Manpages

## How to generate the manpages-documentaion

- You can modify a md file in category\ or packages\ then,

run the script :

```bash
./mix_build.sh # build for website production
./mix_build.sh --package # build for kaisen-webdocs debian package
# if the command is successful, you can view the doc with your browser
# firefox doc/index.html (manpages sorted by category)
# firefox doc/packages/readme.html (manpages sorted by packages A-Z)
```

## How to add a page to the documentation

- If you want to add a md file, you have to create a md in category\ or packages\ folder, then add a line in mix_category.exs or mix_packages.exs, then

  example: README.md was added to category\ and packages\ and a line in mix_category.exs and mix_packages.exs were added.

then run the script :

```bash
./mix_build.sh (or mix_build.sh --package if you build for debian package)
# if the command is successful, you can view the doc with your browser
# firefox doc/index.html (manpages sorted by category)
# firefox doc/packages/readme.html (manpages sorted by packages A-Z)
```

# Install the requirements if necessary

After git cloning this directory:  

You can use the following script to install **git, erlang and elixir** via **asdf manager** :

```bash
# you must have a sudo user
chmod +x install-requirements.sh && ./install-requirements.sh
```

```bash
# then enter the following command to install erlang and elixir via asdf
asdf plugin add erlang && asdf plugin add elixir
asdf install erlang 23.3.1
asdf install elixir 1.11.4-otp-23
# you have to define a global version for erlang and elixir
asdf global elixir 1.11.4-otp-23
asdf global erlang 23.3.1 
```

# Directory definition

- `packages` folder : md files to edit for **manpages sorted by packages from A-Z** (used by mix_category.exs)  
- `category` folder : md files to edit for **manpages sorted by category** (used by mix_category.exs)
- `priv/assets` folder : assets (img, js, css) that are copied in doc folder when generating the doc
    - `priv\assets\doc.css` defines customized kaisen css styles.
    - `doc-versions.js` defines url dropdown for manpages.(2files)
- `doc` folder : Static html documentation is generated in this directory. Folder to put on production webserver.
    - `doc\` contains build html files from mix_category.exs and md category\ folder.
    - `doc\packages` contains build html files from mix_packages.exs and md packages\ folder.

# Configuration

- `mix_category.exs` : configuration for manpages sorted by category with linked md files to build in doc folder
- `mix_packages.exs` : configuration for manpages sorted by packages from A-Z with linked md files to build in doc folder

# version

28/03/2021 - upgrade to v1.6 in mix*.exs
06/04/2021 - fix install_requirements.sh for adding asdf to zsh and bash.
	   - Adding commands to run after launching this script.
	   - Adding .tool-versions for only using elixir 1.11
