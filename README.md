# Ruby on Rails w/PSQL Container

## Introduction ##

This repository provides all files needed to build a Docker image that can run Rails with a PSQL database. The image is intended to provide a universal development environment across all workstations.

## Versions ##

This container currently runs:

* Ruby - 3.2.2
* Rails - 7.1.2
* PostgreSQL - 15
* Node.js - 20

## External Deps ##

Docker
* Download latest version at <https://www.docker.com/products/docker-desktop>

## Building the Image ##

1. Download the all the files in the folder (will have to edit the docker file if you don't want the shortcut commands)
2. Configure the "gems.txt" file to include any gems you want installed locally on the image. Look at the "entrypoint.sh" script if you want to change how the PSQL database is fired up upon starting a container.
3. Run (remove/replace the "lgloera/" if you want):
  `docker build -t lgloera/rails_psql:ruby-3.2.2 .`

## Example ##

See a project developed in this environment at:

 `git clone https://github.com/lgloera2023/famifin/tree/main`

Run the image in Powershell if using windows or the terminal using Linux/Mac:

  `cd famifin`

  `docker run --rm -it --volume "${PWD}:/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 lgloera/rails_psql:3.2.2`

## Helper CLI Commands ##

There are two shell scripts included in the repo that get mapped to the /bin folder of the image.
1. `rserver`
2. `rap`

The first starts up a local HTTP server that you can interact with in your local machine -- essentially an alias for:
  `rails server --binding=0.0.0.0`

The second will precompile your assets (JS, CSS/SCSS, images, etc) -- essentially an alias for:
  `rails assets:precompile`
