class Invoice
  def calculate_total
    # total calculate
  end

  def save_to_db
    # save logic
  end

  def send_email
    # email logic
  end
end

# should be split into separate classes
class InvoiceCalculator
    def calculate_total
        # total calculate
    end
end
    
class InvoiceRepository
    def save_to_db
        # save logic
    end
end
    
class InvoiceMailer
    def send_email
        # email logic
    end
end