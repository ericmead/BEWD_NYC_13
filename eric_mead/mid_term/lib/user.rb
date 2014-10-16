class User
attr_accessor :crates
  attr_reader :user_name, :user_email
  def initialize(user_name, user_email)
    @user_name = user_name
    @user_email = user_email
    @crates = []
  end
  def view_crates
    crates.each do |crate|
      puts "#{crate_name}"
  end
  end
end