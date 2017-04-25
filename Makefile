# Run `make hello` to compile the code into a binary called hello.
hello: hello.cpp
	g++ -std=c++11 hello.cpp -o hello

# Run `make clean` to remove the binary files.
clean:
	rm -rf hello
