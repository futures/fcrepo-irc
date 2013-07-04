require 'cinch'
require 'nokogiri'
require 'fcrepo'

$nick = ENV.fetch('nick', "fcrepo-bot")
$irc_server = ENV.fetch('IRC', "irc.freenode.org")
$channel = ENV.fetch('channel', nil)

bot = Cinch::Bot.new do
  configure do |c|
  	c.nick = $nick
    c.server = $irc_server
    c.channels = [$channel]
  end

  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end
end

Thread.new {
  bot.start
}

# Fcrepo Webhooks documentation:
#   https://wiki.duraspace.org/display/FF/
post '/' do 
  message = Fcrepo::WebhookMessage.new request.body.read
  bot.channel_list.first.msg("*#{message.action}* of \"#{message.identifier}\" at: #{message.repository_url}")
end

