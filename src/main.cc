#include "void_server.h"

int main(int, char**) {
  void_http::server server("127.0.0.1", 5111);

  server.set_not_found_handler([&](){
    server.write("not found");
  });
  server.get("/", [&]() {
    server.write_from_file("index.html");
  });
  
  server.get("/profile", [&]() {
    server.write("<html><body><h1>Profile</h1> <p>Test</p></body></html>");
  });
  
  server.post("/testik", [&](nlohmann::json& data) {
    std::cout << "Received name: " << data["name"] << std::endl;
    std::cout << "Received age: " << data["age"] << std::endl;
  });

  server.run();

  return 0;
}
