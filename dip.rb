#bad example

class NotificationService
    def send_message
        email = EmailService.new
        email.send_email
    end
end

#good example

class NotificationService
    def initialize(sender)
        @sender = sender
    end

    def send_message
        @sender.send
    end
end

class EmailSender
    def send
        puts "Sending Email"
    end
end

class SmsSender
    def send
        puts "Sending SMS"
    end
end

# Usage
NotificationService.new(EmailSender.new).send_message
NotificationService.new(SmsSender.new).send_message