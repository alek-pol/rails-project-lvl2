setup:
	bin/setup

start:
	bin/rails s -p 3000 -b "0.0.0.0"

heroku-console:
	heroku run rails console

heroku-start:
	heroku local -p 3000

heroku-logs:
	heroku logs --tail

ci-setup:
	cp -n .env.example .env || true
	yarn install
	bundle install --without production development
	RAILS_ENV=test bin/rails db:prepare

lint:
	bundle exec rubocop

test:
	NODE_ENV=test bin/rails test

.PHONY: test
