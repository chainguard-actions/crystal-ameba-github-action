# A simple Crystal file that passes Ameba linting
module Hello
  def self.greet(name : String) : String
    "Hello, #{name}!"
  end
end
