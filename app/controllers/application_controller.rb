class ApplicationController < ActionController::Base
  # Needed for nokogiri.
  require 'open-uri'

  def shortener_generate_url(url)
    Shortener::ShortenedUrl.generate(url) # Called during create but after save.
  end

  # Get all of the heading tags from the provided URL. Save them to the tags table.
  def set_heading_tags(url)

    html = URI.open(url)
    parsed_data = Nokogiri::HTML.parse(html)

    heading_one_tags = parsed_data.xpath("//h1")
    heading_one_tags.each do |tag|
      @expert.tags.create(tag: "h1", url: "#{tag.text}")
    end

    heading_two_tags = parsed_data.xpath("//h2")
    heading_two_tags.each do |tag|
      @expert.tags.create(tag: "h2", url: "#{tag.text}")
    end

    heading_three_tags = parsed_data.xpath("//h3")
    heading_three_tags.each do |tag|
      @expert.tags.create(tag: "h3", url: "#{tag.text}")
    end
  end
end
