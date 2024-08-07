# Devops Exam - Paolo Cadiz
Requires `docker` and `docker-compose`

### To enable hooks, please run:
```
git config --local core.hooksPath .githooks/
```

## Part 1
### Using docker
1. To build the image:
```
docker image build --no-cache -t hello-world-webapp:latest .
```
2. To run the built image:
```
docker run -p 8080:8080 hello-world-webapp:latest
```
3. The service should now be accessible via http://localhost:8080

### Using docker-compose
Docker compose was added for Part 2, but can be a quicker alternative for Part 1

1. To build the image:
```
docker compose build
```
2. To run the built image:
```
docker compose up
```
3. The service should now be accessible via http://localhost:8080

## Part 2
### Git commit requirements
Run `git log` which will show two commits. You may run `git show <hash>` to view the commit changes

- The first commit as the initial
- The second commit to update the message from "Hello World" to "Hello Universe" (as well as add the exam notes)

### Automation requirements
For automating with a local git repository, git hooks and docker-compose are used.

- The hook used is `post-commit`, which runs after committing the change
- The hook runs `docker compose build` and `docker compose up -d` to both rebuild the service, as well as to make it accessible via http://localhost:8080

To test the commit hook:
```
# make an update to app.py (update "Hello Universe" back to "Hello World"
git add app.py
git commit -m "test hook"
```
Docker compose should automatically rebuild the image and serve it at http://localhost:8080

## Cleanup
If you've tested the post-commit hook, docker-compose will have the environment up. Run `docker compose down` to shut it down.
