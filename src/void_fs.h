#pragma once

#include <iostream>
#include <fstream>
#include <sstream>

namespace void_http {
  inline std::string read_from_file(const std::string& file_name) {
    std::fstream file_input(file_name, std::ios::in);
    
    if(file_input.is_open()) {
      std::stringstream ss;
      ss << file_input.rdbuf();

      return ss.str();
    }

    throw std::runtime_error("Unable to open file: " + file_name);
  }
}; // void_http
