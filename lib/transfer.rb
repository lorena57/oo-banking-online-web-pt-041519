require 'pry'

class Transfer

  attr_accessor :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
     #binding.pry
  end


  def execute_transaction
    if status == "pending" && valid? == true
        @sender.balance = @sender.balance - @amount
          if @sender.balance < 0
            @status = "rejected"
            return "Transaction rejected. Please check your account balance."
          end
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
      end
    end

   def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
