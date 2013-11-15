# -*- coding: utf-8 -*-
require 'rubygems'
require 'open-uri'
require 'rexml/document'


Plugin.create(:vlc_nowplaying) do
  on_boot do |service|
    UserConfig[:password] ||= ''
    UserConfig[:host] ||= 'http://localhost:8080/'
  end

  def logger(msg)
    ::Plugin.call(:update, nil, [Message.new(message: msg, system: true)])
  end

  command(:vlc_nowplaying,
          name: "VLC #nowplaying",
          condition: lambda{|opt| true},
          visible: true,
          role: :timeline) do |hoge|
    # start point
    uri = "#{UserConfig[:host]}#{(UserConfig[:host]=~/\/$/)?'':'/'}requests/playlist.xml"
    title = ""
    begin
      f = open(uri, {:http_basic_authentication => ['', UserConfig[:password]]})
      raw = f.read
      doc = REXML::Document.new(raw)
      doc.elements.each("node/node/leaf[@current='current']") do |elem|
        title = elem.attributes["name"]
      end
    rescue => exp
      logger "VLC nowplaying error: \"#{exp.message}\" -- Please check vlc status or plugin settings"
    end
      #p title
    if title != "" then
      Service.primary.update(:message => "#{title} #nowplaying")
    end
  end

  settings "VLC #nowplaying" do
    input 'VLC HTTP interface', :host
    input 'Basic auth password', :password
  end
end
