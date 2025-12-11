✅ SOLID Principles (সহজ ভাষায়)

SOLID = ৫টি সফটওয়্যার ডিজাইন প্রিন্সিপল, যা কোডকে—

সহজে পরিবর্তনযোগ্য,

কম বাগ-প্রবণ,

রিইউজেবল,

টেস্টেবল করে তোলে।

1) S — Single Responsibility Principle (SRP)

👉 একটি ক্লাস বা মেথডের একটাই কাজ হওয়া উচিত।

🔥 সহজ উদাহরণ (বাস্তব জীবন)

একজন মানুষ যদি একই সাথে ড্রাইভার + রাঁধুনি + ইলেকট্রিশিয়ান + গার্ড → সব কাজ করে
→ তাহলে ভুল হবেই।

💻 কোড উদাহরণ (Wrong)
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


➡ এখানে Invoice ক্লাস ৩টা কাজ করছে — ভুল।

✔ Correct
class InvoiceCalculator; end
class InvoiceRepository; end
class InvoiceMailer; end

2) O — Open/Closed Principle (OCP)

👉 কোড modify না করে নতুন ফিচার যোগ করা যাবে।
(Classes should be open for extension but closed for modification)

🔥 রিয়েল উদাহরণ

আপনার বাড়ির মাল্টিপ্লাগ খুলে ফেলে না; শুধু নতুন ডিভাইস প্লাগ-ইন করেন → extend।

💻 কোড উদাহরণ
class Payment
  def pay(method)
    if method == :bkash
      # bkash logic
    elsif method == :card
      # card logic
    end
  end
end


➡ নতুন পেমেন্ট যোগ করলে কোড modify করতে হচ্ছে — ভুল।

✔ Better

class PaymentMethod
  def pay; end
end

class Bkash < PaymentMethod
  def pay; puts "paying with bkash"; end
end

class Card < PaymentMethod
  def pay; puts "paying with card"; end
end


➡ নতুন payment method = নতুন class → পুরনো কোডে হাত দিতে হয় না।

3) L — Liskov Substitution Principle (LSP)

👉 Child class parent class-এর জায়গায় সমস্যা ছাড়া ব্যবহার করা যাবে।

🔥 রিয়েল উদাহরণ

“Bird can fly” parent class

Penguin child class, কিন্তু fly করতে পারে না → parent’s rule ভেঙে যাচ্ছে → LSP ভঙ্গ।

💻 Bad Example
class Bird
  def fly; end
end

class Penguin < Bird
  def fly
    raise "I cannot fly"
  end
end


➡ LSP break.

✔ Better

class Bird; end
class FlyingBird < Bird
  def fly; end
end
class Penguin < Bird; end

4) I — Interface Segregation Principle (ISP)

👉 একটি বড় interface এর বদলে ছোট ছোট প্রয়োজনীয় interface তৈরি করা।

🔥 রিয়েল উদাহরণ

আপনাকে যদি ২০টি বোতামসহ একটি রিমোট দেওয়া হয়, কিন্তু আপনার দরকার শুধু ৩টি বোতাম—
⇒ বাকি বোতামগুলো আপনাকে unnecessary burden দিচ্ছে।

💻 কোড উদাহরণ (Bad)
class Worker
  def work; end
  def eat; end
end

class Robot < Worker
  def eat
    raise "Robot cannot eat"
  end
end


✔ Good

module Workable; def work; end; end
module Eatable; def eat; end; end

class Human
  include Workable
  include Eatable
end

class Robot
  include Workable
end

5) D — Dependency Inversion Principle (DIP)

👉 High-level module সরাসরি low-level module-এর উপর depend করবে না;
বরং abstraction-এর উপর depend করবে।

🔥 রিয়েল উদাহরণ

টিভির রিমোট কোম্পানির নির্দিষ্ট সার্কিটের ওপর depend নয়

ব্যাটারি দিলেই চলে (abstraction: "power source")

💻 কোড উদাহরণ (Bad)
class MySQLDatabase
  def connect; end
end

class UserService
  def initialize
    @db = MySQLDatabase.new
  end
end


➡ UserService = MySQL-এর সাথে tightly coupled.

✔ Good (use abstraction)

class UserService
  def initialize(database)
    @db = database
  end
end

class MySQLDatabase; end
class PostgresDatabase; end


➡ এখন যেকোনো DB inject করা যাবে।

🎯 সহজ মনে রাখার টেকনিক (Super Easy)
👉 “S O L I D = SRP / OCP / LSP / ISP / DIP”
Mnemonic 1 — "Single Open Liskov Interface Dependency"

(যেমন একটা গল্পের ৫টি চরিত্রের নাম)

Mnemonic 2 — **“S → One job, O → Modify নয়, L → Replace করা যায়,

I → Small interfaces, D → Abstraction-এ depend”**

Mnemonic 3 — হাতে মনে রাখার ট্রিক

✋ হাতের আঙুল দিয়ে মনে রাখা—

Thumb → S (একটা থাম্ব = one responsibility)

Index → O (extension direction দেখায়)

Middle → L (parent–child লম্বা hierarchy)

Ring → I (ছোট ছোট অংশ = ring sections)

Little → D (detached ছোট আঙুল = loose coupling)

📌 সারাংশ (৫ লাইনে)
Principle	সহজ ভাষায়
S (SRP)	এক ক্লাস = এক কাজ
O (OCP)	extend করো, modify নয়
L (LSP)	child class = parent-এর মতো behave করবে
I (ISP)	বড় interface নয়; ছোট, দরকারি interface
D (DIP)	concrete নয়; abstraction-এর ওপর depend করো


DIP (Dependency Inversion Principle) একটু কঠিন মনে হয়—কিন্তু রিয়েল লাইফ উদাহরণ দিয়ে বুঝলে খুব সহজ।

আমি ৪টি নতুন উদাহরণ দেব—

রিয়েল লাইফ

খুব সহজ কোড উদাহরণ

গেম/অ্যাপ উদাহরণ

ইলেকট্রনিক্স উদাহরণ

তারপর শেষে এক লাইনে remember formula.

🔥 DIP — Dependency Inversion Principle

👉 High-level class (বড় কাজ করা ক্লাস)
Low-level class (ছোট implementation)-এর ওপর depend করবে না;
বরং abstract interface বা abstraction-এর ওপর depend করবে।

মানে:
কোনো ক্লাস যেন নির্দিষ্ট class-এর উপর tightly tied না থাকে → ভবিষ্যতে সহজে বদলানো যায়।

1) রিয়েল লাইফ উদাহরণ (সবচেয়ে সহজ)
🛜 উদাহরণ: চার্জার + মোবাইল

পুরনো Nokia ফোন = আলাদা চার্জার

Samsung = আলাদা চার্জার

Apple = আলাদা চার্জার

➡ ফোন কোম্পানি charger company-র ওপর dependent → huge সমস্যা
(এটা DIP-এর বিরুদ্ধে)

✔ এখনকার বিশ্ব (USB Type-C / Lightning)

ফোন বলে না:

“আমাকে Samsung চার্জার দাও।”

বরং বলে:

“আমাকে Power Source দাও।”

Power Source = abstraction
USB-C চার্জার = low-level implementation

📌 এখন ফোন depend করছে না:

Samsung charger

Apple charger

Xiaomi charger

Laptop charger

ফোন depend করছে “PowerSource interface”-এর ওপর।

এটাই Dependency Inversion Principle.

2) Coding Example (Super simple)
❌ Bad (DIP violate)
class NotificationService
  def send_message
    email = EmailSender.new
    email.send_email
  end
end


এখানে NotificationService ক্লাস EmailSender-এ আটকে গেছে।
যদি SMS বা Push Notification যোগ করতে চাই → মূল কোডে পরিবর্তন করতে হবে।

✔ Good (DIP follow)
class NotificationService
  def initialize(sender)
    @sender = sender   # abstraction
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

ব্যবহার:
NotificationService.new(EmailSender.new).send_message
NotificationService.new(SmsSender.new).send_message


📌 এখন:

Email বাদ দিয়ে SMS দিলে কোনো কোড পরিবর্তন নেই

future এ WhatsAppSender যোগ করলেও main code বদলাতে হবে না

3) Game/App Example (সহজভাবে)

ধরো একটি গেমে Sound Manager আছে:

❌ Bad
class GameSound
  def play_sound
    mp3 = Mp3Player.new
    mp3.play
  end
end


➡ এখন গেম কেবল mp3 support করবে।
➡ wav/ogg/flac চাইলে main code বদলাতে হবে।

✔ Good (DIP)
class GameSound
  def initialize(player)
    @player = player
  end

  def play_sound
    @player.play
  end
end

class Mp3Player   ; def play; puts "mp3"; end; end
class WavPlayer   ; def play; puts "wav"; end; end
class OggPlayer   ; def play; puts "ogg"; end; end


গেম main code একই থাকে।
ফরম্যাট বদলালে শুধু নতুন class add করলেই হয়।

এটাই DIP.

4) ইলেকট্রনিক্স উদাহরণ

ধরো আপনি লাইট অন করার জন্য একটি switch ব্যবহার করছেন।

❌ Bad (violates DIP)

Switch = শুধুই LED লাইট চালায়
(Incandescent, Tube Light, Fan → কাজ করবে না)

✔ Good (DIP)

Switch depend করে "ElectricDevice" interface"-এর ওপর
কোন device plug-in করা হচ্ছে → সেটা matter না।

LED

Fan

Motor

Tube light

সবই চলবে।

Switch শুধু “ElectricDevice.turnOn()” কল করে।
কোন device, তা switch জানে না → abstraction।

এটাই DIP.

🎯 ১ লাইনে DIP মনে রাখার সহজ ফর্মুলা
👉 “Depend on abstraction, not on implementation”

অথবা

👉 “ফোন চার্জার নয়, power source-এ depend করে”