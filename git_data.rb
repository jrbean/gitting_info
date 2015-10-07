require "pry"
require "httparty"



key = File.read("./git_secret")
response = HTTParty.get "https://api.github.com/orgs/Rails/members", headers: {
    "Authorization" => "token #{key}",
    "User-Agent" => "lando calrissian"
  }

response.each do |us| us["login"]
  repos_get = HTTParty.get "https://api.github.com/users/#{us["login"]}/repos", headers: {
    "Authorization" => "token #{key}",
    "User-Agent" => "lando calrissian"
    }
    repos_get.each do |rget|
      puts "#{rget["names"]}"
    end
  end
