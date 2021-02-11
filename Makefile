LIB_NAME=add1
SO_EXT=so
MAKEFILE_PATH := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

all: c-src/lib$(LIB_NAME).$(SO_EXT) cabal.project.local

c-src/$(LIB_NAME).o: c-src/$(LIB_NAME).c
	$(CC) -c -Wall -fpic $< -o $@

c-src/lib$(LIB_NAME).$(SO_EXT): c-src/$(LIB_NAME).o
	$(CC) -shared $< -o $@

cabal.project.local:
	echo "package ghc-t19350" >> $@
	echo "  extra-lib-dirs: $(MAKEFILE_PATH)/c-src" >> $@
	echo "  ld-options: -Wl,-rpath=$(MAKEFILE_PATH)/c-src" >> $@

.PHONY: clean
clean:
	rm -f c-src/$(LIB_NAME).o c-src/lib$(LIB_NAME).$(SO_EXT) cabal.project.local
