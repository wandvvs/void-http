#pragma once

#include "void_fs.h"

#include <boost/asio.hpp>
#include <nlohmann/json.hpp>

#include <iostream>
#include <unordered_map>

namespace void_http {
  class server {
  public:
    explicit server(int port);
    server(const std::string& ip_address, int port);

    void run();
    void write(const std::string& html);
    void write_from_file(const std::string& file);

    void get(const std::string& url, std::function<void()> handler);
    void post(const std::string& url, std::function<void(nlohmann::json& data)> handler);

    void set_not_found_handler(std::function<void()> handler);
  private:
    void start_accept();
    void handle_request();

    boost::asio::io_service io_service_;
    boost::asio::ip::tcp::socket client_;
    boost::asio::ip::tcp::acceptor server_;
    enum { max_length = 1024 };
    char data_[max_length];

    std::unordered_map<std::string, std::function<void()>> get_handlers_;
    std::unordered_map<std::string, std::function<void(nlohmann::json& data)>> post_handlers_;

    std::function<void()> not_found_handler_;
  };
}; // void_http
