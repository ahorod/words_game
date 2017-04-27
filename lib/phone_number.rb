class Phone_number
   @@phone_numbers = []

  attr_accessor(:area_code, :number, :type, :id)

  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch('area_code')
    @number = attributes.fetch('number')
    @type = attributes.fetch('type')
    @id = @@phone_numbers.length().+(1)
  end


  define_singleton_method(:all) do
    @@phone_numbers
  end

  define_method(:save) do
    @@phone_numbers.push(self)
  end

  define_singleton_method(:clear) do
    @@phone_numbers = []
  end

  define_singleton_method(:find) do |id|
    found_number = nil
    @@phone_numbers.each() do |phone_number|
      if phone_number.id().eql?(id)
        found_number = phone_number
      end
    end
    found_number
  end
end
