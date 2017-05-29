
require 'pry'

def method_missing method_name, *args
  taggeize(method_name, *args) do
    yield if block_given?
  end
end
def taggeize(method_name, *args)
  arg = args.first
  if arg.is_a? Hash
    args = arg.map{|k,v| "#{k}=#{v.inspect}"}.join(' ')
    puts "<#{method_name} #{args}>"
  else
    puts "<#{method_name}>#{arg}"
  end
  yield if block_given?
  print "</#{method_name}>"
end

def argumentize(*args)
  args.map do |arg|
  end
end

html do
  head do
    title "Welcome"
  end
  body do
    div class: "container" do
      h1 "Our ruby is working"
      ul do
        li "That's amazing!"
        li "I can't believe"
      end
    end
  end
end
