class Proxy

  attr_accessor :messages

  def initialize(target_object)
    @object = target_object
    # ADD MORE CODE HERE
    @messages = []
  end
  
  # WRITE CODE HERE
  def method_missing(method, *args, &block)
      @messages.push(method)
      @object.send(method, *args) if @messages.include?(method) 
  end

  def called? method
      @messages.include?(method) 
  end

  def number_of_times_called

  end
end

class Television
  attr_accessor :channel

  def power
    if @power == :on
      @power = :off
    else
      @power = :on
    end
  end

  def on?
    @power == :on
  end
end


tv = Proxy.new(Television.new)

    tv.power
    tv.channel = 10

   tv.power

    p tv.messages
    p tv.messages.select{ |v| v == :power}