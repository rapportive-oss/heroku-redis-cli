require File.dirname(__FILE__) + '/lib/redis_console.rb'

Heroku::Command::Help.group('Redis Console') do |group|
  group.command 'redis:cli [--db REDIS_URL] *args', 'Open a redis-cli shell to the database'
  group.command 'redis:info [--db REDIS_URL]', 'Get INFO for the redis database'
  group.command 'redis:monitor [--db REDIS_URL]', 'MONITOR the redis database'
end
