if defined? BetterErrors
  # Private subnets defined by RFC1918 as stated in https://docs.docker.com/v1.5/articles/networking/
  BetterErrors::Middleware.allow_ip! '0.0.0.0/0'
  BetterErrors::Middleware.allow_ip! '192.168.33.10'
end