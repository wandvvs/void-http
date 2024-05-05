#include "void_server.h"
#include "void_fs.h"

#include <boost/asio/impl/read_until.hpp>
#include <boost/asio/streambuf.hpp>
#include <boost/beast/http/message.hpp>
#include <boost/beast/http/string_body.hpp>
#include <nlohmann/json_fwd.hpp>
#include <sstream>

namespace void_http {
  server::server(int port)
    : server_(io_service_, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), port)),
      client_(io_service_) {
        start_accept();
      }

  server::server(const std::string& ip_address, int port)
    : server_(io_service_, boost::asio::ip::tcp::endpoint(boost::asio::ip::address::from_string(ip_address), port)),
      client_(io_service_) {
        start_accept();
      }

  void server::run() {
    std::cout << "Server started and listening on "
              << server_.local_endpoint().address().to_string() << ':' << server_.local_endpoint().port() << std::endl;
    io_service_.run();
  }

  void server::start_accept() {
    server_.async_accept(client_, 
      [this](boost::system::error_code ec) {
        if(!ec) {
          handle_request();
        }
      start_accept();
    });
  }
  
  void server::handle_request() {
    auto request_buffer = std::make_shared<boost::asio::streambuf>();

    boost::asio::async_read_until(client_, *request_buffer, "\r\n\r\n",
      [this, request_buffer](boost::system::error_code ec, std::size_t) {
        if(!ec) {
          std::istream request_stream(request_buffer.get());
          std::string request_line;
          std::getline(request_stream, request_line);

          std::string method, url;
          std::istringstream request_line_stream(request_line);
          request_line_stream >> method >> url;
          
          std::stringstream body_stream;
          body_stream << request_stream.rdbuf();
          std::string body = body_stream.str();

          std::function<void()> handler = nullptr;

          if (method == "GET") {
            if(get_handlers_[url]) {
              handler = get_handlers_[url];
            }
          } else if(method == "POST") {
            if(post_handlers_[url]) {
              size_t json_start_pos = body.find("\r\n\r\n");
              if (json_start_pos != std::string::npos) {
              json_start_pos += 4; 
              std::string json_data = body.substr(json_start_pos);
              nlohmann::json parsed_json = nlohmann::json::parse(std::move(json_data));

              handler = std::bind(post_handlers_[url], std::move(parsed_json));
            }
          } else {
                std::cerr << "JSON data not found in request body" << std::endl;
            }
          }
          if (handler) {
            handler();
            client_.close();
          } else {
            if (not_found_handler_) {
              not_found_handler_();
            } else {
              throw std::runtime_error("not_found_handler_ is not defined. Use set_not_found_handler(handler)");
            }
            client_.close();
          }
          
        } else {
          std::cerr << "Error reading request: " << ec.message() << std::endl;
          client_.close();
        }
      });
  }

  void server::get(const std::string& url, std::function<void()> handler) {
    get_handlers_[url] = handler;
  }

  void server::post(const std::string& url, std::function<void(nlohmann::json& data)> handler) {
    post_handlers_[url] = handler;
  }

  void server::write(const std::string& html) {
    std::string html_response = "HTTP/1.1 200 OK\r\n";
    html_response += "Content-Type: text/html\r\n\r\n";
    html_response += html;
    boost::asio::async_write(client_, boost::asio::buffer(std::move(html_response)),
      [this](boost::system::error_code ec, std::size_t) {
          if (ec) {
            std::cout << "Failed write to the client." << std::endl;
          }           
          client_.close();
      });
  }

  void server::write_from_file(const std::string& file) {
    write(read_from_file(file));
  }
  
  void server::set_not_found_handler(std::function<void()> handler) {
    not_found_handler_ = handler;
  }
}; // void_http
