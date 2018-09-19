CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra -pedantic -g3

file: fileN.c Makefile
	$(CC) $(CFLAGS) -o fileN fileN.c

gdb_test: fileN test.gdb Makefile
	gdb -q -x test.gdb $<

../src.zip: fileN.c Makefile test.sh test.gdb
	cd .. && zip src.zip src/file.c src/Makefile src/test.sh src/test.gdb

clean:
	rm -f *.o
	rm -f file

.PHONY: clean gdb_test
