class PaymentMethod
    def pay; end
end

class Bkash < PaymentMethod
    puts "paying with bkash"
end

class Nagad < PaymentMethod
    puts "paying with nagad"
end