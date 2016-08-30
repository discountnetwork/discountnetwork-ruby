module DiscountNetwork
  class Base
    def self.method_missing(method_name, *arguments, &block)
      if new.respond_to?(method_name, include_private: false)
        new.send(method_name, *arguments, &block)
      else
        super
      end
    end

    private

    def build_array_params(array_params)
      array_params = [array_params].flatten
      array_params.map.each_with_index do |attribute, index|
        [index, attribute]
      end.to_h
    end
  end
end
