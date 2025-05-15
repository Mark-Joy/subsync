
ifeq ($(PREFIX),)
	PREFIX := /usr/local
endif


all:
	clang -Wall -liconv -O3 -o subsync subsync.c

clang:
	clang -Wall -liconv -O3 -o subsync subsync.c

clang-static:

	clang -static -Wall -liconv -O3 -o subsync subsync.c

gcc:
	gcc -Wall -liconv -O3 -o subsync subsync.c

gcc-static:
	gcc -static -Wall -liconv -O3 -o subsync subsync.c

clean:
	rm -f subsync

install: subsync
	install -s subsync $(PREFIX)/bin
	install -d $(PREFIX)/share/man/man1
	install -m 644 subsync.1 $(PREFIX)/share/man/man1

uninstall:
	rm -f $(PREFIX)/bin/subsync $(PREFIX)/share/man/man1/subsync.1
