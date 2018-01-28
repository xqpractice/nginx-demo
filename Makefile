VERSION = `cat VERSION`

git-release:
	git fetch --tags
	git tag -a release-v${VERSION} -m "Release version ${VERSION}"
	git push --tags

start:
	docker-compose build
	docker-compose up -d

stop:
	docker-compose stop

rm: stop
	sleep 3
	docker-compose rm -f

restart: rm start
