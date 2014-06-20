def echo(message)
  message
end

def shout(message)
  message.upcase
end

def repeat(message, count=2)
  ([message] * count).join(" ")
end 
