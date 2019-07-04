require 'digest/md5'
require 'dotenv'

class Auth
  def self.time_now
    Time.now.to_i.to_s
  end

  def self.gen_auth_params
    @ts = time_now
    @apikey = ENV['PUBLIC_KEY']
    @hash = Digest::MD5.hexdigest(@ts + ENV['PRIVATE_KEY'] + @apikey)
    "ts=#{@ts}&apikey=#{@apikey}&hash=#{@hash}"
  end
end
