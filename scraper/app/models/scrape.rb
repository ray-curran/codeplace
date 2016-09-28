class Scrape
  attr_accessor :title, :hotness, :image_url, :rating, :director,
  :genre, :runtime, :synopsis, :failure

  def scrape_new_movie
    begin
      doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/m/the_martian/"))
      doc.css('script').remove 
      self.title = doc.at_css('#movie-title').text.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
      self.hotness = doc.at_css('.meter-value').text.to_i
      self.image_url = doc.at_css('#movie-image-section img')['src'] 
      self.rating = doc.css('.meter-value').last.text.to_i
      self.director = doc.css('.info div span')[1].text
      self.genre = doc.css('.info div span')[0].text
      self.runtime = doc.css('.info div time').last.text.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
      s = doc.css('#movieSynopsis').text
      if ! s.valid_encoding?
        s = s.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
      end
      self.synopsis = s      
      return true
    rescue Exception => e
      self.failure = "Something went wrong with the scrape"
    end
  end

  def save_movie
    movie = Movie.new(
      title: self.title,
      hotness: self.hotness,
      image_url: self.image_url,
      synopsis: self.synopsis,
      rating: self.rating,
      genre: self.genre,
      director: self.director,
      runtime: self.runtime
      )
    movie.save
    if movie.errors
      movie.errors.each { |error| puts error}
    end
  end
end