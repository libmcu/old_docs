FROM --platform=linux/amd64 alpine:latest

ENV LANG C.UTF-8
ENV REFRESHED_AT 2022-11-04

RUN apk add \
	make \
	git \
	llvm-dev \
	python3 \
	py3-pip \
	doxygen \
	plantuml \
	graphviz \
	fontconfig \
	freetype \
	ttf-dejavu \
	bash \
	tar \
	&& \
	pip install \
	sphinx \
	sphinx_rtd_theme \
	m2r2 \
	sphinx_markdown_tables \
	breathe \
	sphinxcontrib-plantuml \
	sphinx-math-dollar \
	sphinx-collapse \
	&& \
	wget https://github.com/plantuml/plantuml/releases/download/v1.2022.12/plantuml-1.2022.12.jar -O /usr/share/java/plantuml.jar
