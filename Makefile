build:
	docker image build -t graphiql:latest .

run:
	docker container run \
	--name graphiql \
	-p 4000:4000 \
	-e API_ENDPOINT=http://localhost:3000/graphql \
	-d graphiql:latest

clean: stop rm

publish: tag push

rm:
	docker container rm graphiql

stop:
	docker container stop graphiql

tag:
	docker tag graphiql:latest corykitchens/graphiql:latest

push:
	docker push corykitchens/graphiql:latest