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
    uri = "#{UserConfig[:host]}#{(UserConfig[:host]=~/\/$/)?'':'/'}requests/status.xml"
    raw_data = ""
    post_data = ""
    title = ""
    artist = ""
    album = ""
    begin
      f = open(uri, {:http_basic_authentication => ['', UserConfig[:password]]})
      raw = f.read
      doc = REXML::Document.new(raw)
      raw_data = doc.elements["//root/information"].to_s 
      begin
        title = doc.elements["//root/information/category/info[@name='title']"].text
        artist = doc.elements["//root/information/category/info[@name='artist']"].text
        album = doc.elements["//root/information/category/info[@name='album']"].text
        post_data = title + ", " + album + ", " + artist + ", #now_playing #mikutter "
      rescue => exp
        if title == "" then
          post_data=doc.elements["//root/information/category/info[@name='filename']"].text
		    end
	    end
      #Plugin.call(:update, nil, [Message.new(:message => raw_data, :system => true)])  
      #Plugin.call(:update, nil, [Message.new(:message => post_data, :system => true)])  
    rescue => exp
      Plugin.call(:update, nil, [Message.new(:message => raw_data, :system => true)])  
      logger "VLC nowplaying error: \"#{exp.message}\" -- Please check vlc status or plugin settings"
    end
    if post_data != "" then
      Service.primary.update(:message => post_data)
    end
  end
  settings "VLC #nowplaying" do
    input 'VLC HTTP interface', :host
    input 'Basic auth password', :password
  end
end
