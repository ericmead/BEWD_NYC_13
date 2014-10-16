class Artist
  attr_accessor :contents
  attr_reader :artist_name, :download_links
  def initialize(artist_name, download_links)
    @artist_name = artist_name
    @download_links = download_links
    @contents = []
  end
   def view_cratecontents
      puts "#{artist_name}"
      puts "#{download_links}"
  end
end
