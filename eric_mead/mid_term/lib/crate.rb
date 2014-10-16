class Crate
  attr_accessor :artists
  attr_reader :crate_name, :artists_number
  def initialize(crate_name, artists_number)
  @crate_name = crate_name
  @artists_number = artists_number
  @artists = []
  end
  def view_artists
    artists.each do |artist|
      puts "#{artist_name}"
      puts "#{download_links}"
  end
end
end
