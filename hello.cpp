#include <iostream>

void sayHello(const std::string &name) {
	std::cout << "Hello, " << name << "!" << std::endl;
}

int main() {
	std::cout << "Enter your name: ";
	std::string name;
	std::getline(std::cin, name);
	sayHello(name);
	return 0;
}
