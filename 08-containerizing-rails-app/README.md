# Ex.08 Containerizing a Rails App

Containerize an example Rails App.

Check this files to be modified on this [commit](https://github.com/jlebrijo/spike/commit/e7643ded0827d41757ade2edd8c3cde55ed22728):
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

Commands to push your docker image to Github Packages:
* `docker login docker.pkg.github.com -u jlebrijo -p <GITHUB_TOKEN>` login to Github.
* `docker build -t docker.pkg.github.com/jlebrijo/spike/spike .` build image.
* `docker push docker.pkg.github.com/jlebrijo/spike/spike` push image.
