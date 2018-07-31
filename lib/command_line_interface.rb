class CommandLineInterface

  def greeting
    puts "Hi there! Welcome to iNVEST!"
    puts "Please enter your name"
    gets_user_input
  end

  def gets_user_input
    @user_input = gets.chomp
    user_greeting(@user_input)
  end

  def user_greeting(name)
    puts "Hi #{name}! Come on in!"
  end

  # def valid?
  #   investor_name = @user_input.downcase
  #   if investor_name == Investor.name# && self.total_balance_in_dollars > 0
  #     return true
  #   else
  #     return false
  #   end
  # end

  def user_prompt
    puts "Are you here to invest or invent?"
    input = gets.chomp
    if input.downcase == "invest"
      #investor_name_arr = Investor.all.map {|n| n.name}.to_s
      # verify = investor_name_arr.include?(@user_input.downcase)
      #
      # Investor.find_by(verify) #Exising Monty Object from Investor Class
      #
      #
      # if verify == false
      name = Investor.find_or_create_by(name: @user_input.downcase)
        # puts "What company do you work for?"
        # company_input = gets.chomp
        # x = Investor.create(name: @user_input, company: company_input)
        # puts x
      puts "Welcome #{name}!"
    else
      input.downcase == "invent"
      name = Investor.find_or_create_by(name: @user_input.downcase)
      puts "Welcome #{name}!"
    end

  end

  def run
    greeting
    user_prompt
  end
end
