class Scrape
  attr_accessor :title, :hotness, :image_url, :rating, :director,
  :genre, :runtime, :synopsis, :failure

  def scrape_new_movie
    begin
      doc = Nokogiri::HTML(open("http://www.rottentomatoes.com/m/the_martian/"))
      doc.css('script').remove 
      self.title = doc.at("//h1[@itemprop = 'name']").text  
      self.hotness = doc.at("//span[@itemprop = 'ratingValue']").text.to_i 
      self.image_url = doc.at_css('#movie-image-section img')['src'] 
      self.rating = doc.at("//td[@itemprop = 'contentRating']").text 
      self.director = doc.at("//td[@itemprop = 'director']").css('a').first.text 
      self.genre = doc.at("//span[@itemprop = 'genre']").text 
      self.runtime = doc.at("//time[@itemprop = 'duration']").text 
      self.synopsis = doc.css('#movieSynopsis').text 
      return true
    rescue Exception => e
      self.failure = "Something went wrong with the scrape"
    end
  end
end