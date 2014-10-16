class Building
  attr_accessor :apartments
  attr_reader :building_name, :building_address
  def initialize(building_name, building_address)
    @apartments = []
    @building_name = building_name
    @building_address = building_address
  end  
  def view_apartments
    apartments.each do |apartment|
      puts "#{apartment.number}"
    end
  end
end