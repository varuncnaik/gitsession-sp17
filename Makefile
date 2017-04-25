# Typically, variables that are common across multiple targets are written at
# the top of the Makefile.
CC=g++
CFLAGS=-std=c++11

# Run `make hello` to compile the code into a binary called hello.
# $^ represents the dependencies (right-hand side of the colon).
# $@ represents the target name (left-hand side of the colon).
hello: hello.cpp
	$(CC) $(CFLAGS) $^ -o $@

# For most targets, such as hello above, the name of the target corresponds to
# the name of a file. We state that clean is a phony target, because there is
# no file named clean.
.PHONY: clean

# Run `make clean` to remove the binary files.
clean:
	rm -rf hello
