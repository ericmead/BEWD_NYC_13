class Apartment
  attr_accessor :number
  attr_accessor :renter
  attr_accessor :rent
  attr_reader :apartment_number, :apartment_square_feet, :apartment_bedrooms, :apartment_bathrooms
  def initialize(apartment_number, apartment_square_feet, apartment_bedrooms, apartment_bathrooms)
    @apartment_square_feet = apartment_square_feet
    @apartment_bedrooms = apartment_bedrooms
    @apartment_bathrooms = apartment_bathrooms
    @number = apartment_number
    @renter = renter
    @rent = rent
  end
end
