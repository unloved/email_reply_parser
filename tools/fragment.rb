#!/usr/bin/env ruby
$LOAD_PATH.unshift './lib'
require 'email_reply_parser'
require 'mail'

raise 'First argument - name of text email file' unless ARGV[0]

mail = Mail.new(IO.read ARGV[0])

parser = EmailReplyParser.parse(mail)

fragments = parser.fragments.find_all{|f| !f.hidden? and !f.signature? and !f.quoted?}

puts "--fragments:"

fragments.each do |f|
  puts f
end

puts "--reply:"

puts parser.get_reply
