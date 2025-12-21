#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

vector<string> readFile(const string& filePath) {
    ifstream file(filePath);
    if (!file.is_open()) {
        cerr << "Error opening file: " << filePath << "\n";
        return {};
    }

    vector<string> lines;
    string line;
    while (getline(file, line)) {
        lines.push_back(line);
    }
    return lines;
}

int main() {
    const string filePath = "input.txt";
    const auto lines = readFile(filePath);
    for (const auto& line : lines) {
        cout << line << '\n';
    }
    return 0;
}