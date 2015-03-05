# `adocker` is alias to `azk docker`
all:
	adocker build -t azukiapp/mongodb .

no-cache:
	adocker build --rm --no-cache -t azukiapp/mongodb .
