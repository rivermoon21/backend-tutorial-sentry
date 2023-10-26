SENTRY_AUTH_TOKEN=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
SENTRY_ORG=self-2mo
SENTRY_PROJECT=python-django-tutorial
VERSION=`sentry-cli releases propose-version`

deploy: install create_release associate_commits run_django

install:
	pip install -r ./requirements.txt

create_release:
	sentry-cli releases -o $(SENTRY_ORG) new -p $(SENTRY_PROJECT) $(VERSION)

associate_commits:
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) \
		set-commits $(VERSION) --auto

run_django:
	VERSION=$(VERSION) python manage.py runserver
