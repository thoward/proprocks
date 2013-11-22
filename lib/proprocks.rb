module PropRocks
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def prop(name, default=nil)
      attr_accessor name

      define_method name do |*values|
        value = values.first
        value ? self.send("#{name}=", value) : (instance_variable_get("@#{name}") || default)
      end
    end
  end

  def initialize(attrs = {}, &block)
    if attrs
      attrs.each do |k,v|
        self.send "#{k}=", v
      end
    end
    self.instance_eval(&block) if block_given?
  end
end
