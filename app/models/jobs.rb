class Jobs < ActiveRecord::Base
  require 'will_paginate/array'

  # Model self callable method to update the data from atom feed
  def self.update_from_feed(feed_url)
    Jobs.delete_all
    feed = Feedjira::Feed.fetch_and_parse(feed_url)
    feed.entries.each do |entry|
      unless exists? :id=>entry.id
        create!(
          :id         =>  entry.id,
          :link       =>  entry.url,
          :title      =>  entry.title,
          :author     =>  entry.author,
          :content    =>  entry.content,
          :updated_at =>  entry.updated,
          :created_at =>  entry.published,
        )
      end
    end
  end

  # Method to validate the existing data/jobs with the latest atom feed
  def self.validate_from_feed(new_feed)
    Jobs.delete_all
  end
end
