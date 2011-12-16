require 'uri'
class Heroku::Command::Redis < Heroku::Command::Base

  def cli(*queries)
    # Must remember to extract these so they don't get passed to redis-cli
    db = extract_option("--db") || 'REDISTOGO_URL'
    app = extract_app_in_dir(".")

    redis_url = heroku.config_vars(app)[db]
    return puts "No such redis (#{db}), try setting --db REDIS_URL." unless redis_url
    uri = URI.parse(redis_url)

    cmd = ["redis-cli"]
    cmd << "-a" << uri.password if uri.password
    cmd << "-h" << uri.host if uri.host
    cmd << "-p" << uri.port.to_s if uri.port
    cmd << "-n" << uri.path.gsub("/", "").to_i.to_s

    # queries are set by monitor and info, and args are remaining command line arguments
    # passed to heroku redis.
    exec *(cmd + args + queries)
  end

  def monitor; cli 'monitor'; end
  def info; cli 'info'; end
end
