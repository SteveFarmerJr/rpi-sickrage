currentdate = $(shell date +%y%m%d)

build:
	docker build -t napnap75/rpi-sickrage:latest .

push: build
	docker push napnap75/rpi-sickrage:latest
	docker tag napnap75/rpi-sickrage:latest napnap75/rpi-sickrage:$(currentdate)
	docker push napnap75/rpi-sickrage:$(currentdate)
