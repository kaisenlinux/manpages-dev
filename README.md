# README

This project is to generate manpages website for https://kaisenlinux.org/manpages and kaisen-webdocs deb package.

You must run those script on a **fresh installation** of kaisen linux each time a new rolling is distributed.

The only requirement is git-core and kaisen linux MATE.

## Sequential steps to build manpages

### Step 1

```bash
./manpages-build.sh --fullbuild
```
This script parse the kaisen linux system and the kaisen linux menu to generate an **output_fullbuild_DDMMYYYY** directory.

Then it update the current repository.

### Step 2

You can use the following script to install **git, erlang and elixir** via **asdf manager** :

```bash
chmod +x install-requirements.sh && ./install-requirements.sh
```

```bash
# then enter the following command to install erlang and elixir via asdf
asdf plugin-add erlang && asdf plugin-add elixir
asdf install erlang 25.0.1
asdf install elixir 1.13.4-otp-25
# you have to define a global version for erlang and elixir
asdf global elixir 1.13.4-otp-25
asdf global erlang 25.0.1 
```

### Step 3

You can run the build of the kaisen linnux manpages website for the official kaisen linux website or for the deb package.

```bash
./mix_build.sh # build for website production
./mix_build.sh --package # build for kaisen-webdocs debian package
# if the command is successful, you can view the doc with your browser
# firefox doc/index.html (manpages sorted by category)
# firefox doc/packages/readme.html (manpages sorted by packages A-Z)
```

- For official kaisen linux website :
You can now copy doc/* in the kaisen prod website/manpages/ folder.

- For official kaisen linux kaisen-webdocs package
You can now copy doc/* in kaisen-manpages/ folder.


## Directory definition

- `packages` folder : md files to edit for **manpages sorted by packages from A-Z** (used by mix_category.exs)  
- `category` folder : md files to edit for **manpages sorted by category** (used by mix_category.exs)
- `priv/assets` folder : assets (img, js, css) that are copied in doc folder when generating the doc
    - `priv\assets\doc.css` defines customized kaisen css styles.
    - `doc-versions.js` defines url dropdown for manpages.(2files)
- `doc` folder : Static html documentation is generated in this directory. Folder to put on production webserver.
    - `doc\` contains build html files from mix_category.exs and md category\ folder.
    - `doc\packages` contains build html files from mix_packages.exs and md packages\ folder.
- `lib` folder : Bash functions used by manpages-build.sh

## Configuration

- `mix_category.exs` : configuration for manpages sorted by category with linked md files to build in doc folder
- `mix_packages.exs` : configuration for manpages sorted by packages from A-Z with linked md files to build in doc folder

## Troubleshooting

If you have an error when running mix_build.sh with `mix command not found`:
- enter : asdf global erlang 25.0.1 && asdf local elixir 1.13.4-otp-25                            
- verify your are in zsh (or switch to bash and rereun the script)
- delete mix.log
- or you missed the step : ./install_requirements.sh

## version

12/07/2022 - Add more docker manpages that are not in kaisen-menu
28/03/2021 - upgrade to v1.6 in mix*.exs  
06/04/2021 - fix install_requirements.sh for adding asdf to zsh and bash.  
	   - Adding commands to run after launching this script.  
	   - Adding .tool-versions for only using elixir 1.11  
	   - Updating asdf command in script  	
07/04/2021 - Integrating build script of manpages in the manpages-dev repository  
	   - Adding helper script deploy.sh
06/12/2021 - fix lib/ dir missing files and build manpages for kaisen 2.0
