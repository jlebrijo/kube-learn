# Ex.08 Containerizing a Rails App

Containerize an example Rails App.

Check this files to be modified on this [commit](https://github.com/jlebrijo/spike/commit/454ef035254215f6d4d468b3b78d4f8ce105f53c):
* Dockerfile: image builder.
* docker-compose.yml: simulates a production environment.
* config/database.yml: to point to postgres container.
* .dockerignore: basically a copy of .gitignore, to avoid copy of several files into image.

Run containers:
* `git clone git@github.com:jlebrijo/spike.git` clone repo.
* `cd spike`
* `docker system prune -af` reset your docker environment.
* `docker-compose build` build image.
* `docker-compose run app bundle exec rake db:create db:migrate db:seed` run database scripts.
* `docker-compose up` run containers.

Check http://localhost:3000 with login user@example.com/123456

Useful commands:
* `docker-compose exec app tail -f log/*`
* `docker-compose exec app rails c`

Run tests for the image:
* `docker-compose run -e RAILS_ENV=test app rails db:create` create test database.
* `docker-compose run -e RAILS_ENV=test app rspec` run tests.

Commands to push your docker image to Github Packages:
* `docker login -u jlebrijo` login to DockerHub.
* `docker build -t jlebrijo/spike .` build image.
* `docker push jlebrijo/spike` push image.
