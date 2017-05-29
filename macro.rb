class Finder < Array
  def self.find_by attribute
    define_method("find_by_#{attribute}") do |value|
      self.find do |element|
        element[attribute].match value
      end
    end
  end
  find_by :name
end
puts Finder.new(
  [
    {name: 'Jônatas', twitter: 'jonatasdp'},
    {name: 'Leandro Parazito', twitter: 'parazito'}
  ]
).find_by_name(/Leandro/)
