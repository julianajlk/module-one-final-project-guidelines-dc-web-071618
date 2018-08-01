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
    invest_or_invent_prompt
  end

  def invest_or_invent_prompt
    puts "Are you an Investor or an Inventor?"
    @invest_or_invent_input = gets.chomp
    if @invest_or_invent_input.downcase == "investor"
      investor_prompt(@invest_or_invent_input)
    elsif  @invest_or_invent_input.downcase == "inventor"
      inventor_prompt(@invest_or_invent_input)
    else
      puts "Try again!"
      invest_or_invent_prompt
      # user_greeting(@user_input)
    end

  end

  # def main_menu_invest
  #   #1. See my investments <- investor_investments
  #   #2.
  # end
  #
  # def main_menu_invent
  #
  # end

  # def valid?
  #   investor_name = @user_input.downcase
  #   if investor_name == Investor.name# && self.total_balance_in_dollars > 0
  #     return true
  #   else
  #     return false
  #   end
  # end

  def investor_prompt(input)
      #investor_name_arr = Investor.all.map {|n| n.name}.to_s
      # verify = investor_name_arr.include?(@user_input.downcase)
      #
      # Investor.find_by(verify) #Exising Monty Object from Investor Class
      #
      #
      # if verify == false
    @investor_name = Investor.find_or_create_by(name: @user_input)
        # puts "What company do you work for?"
        # company_input = gets.chomp
        # x = Investor.create(name: @user_input, company: company_input)
        # puts x
    if @investor_name.total_balance_in_dollars == nil
      puts "Welcome #{@investor_name.name}! You have $0 in your account. How much would you like to add to your account?"
        input_account = gets.to_i
        puts "You have $#{input_account} in your account."

    else
      puts "Welcome #{@investor_name.name}! You have #{@investor_name.total_balance_in_dollars} in your account.How much would you like to add to your account?"
        input_account = gets.to_i
        new_balance = input_account +@investor_name.total_balance_in_dollars
          puts "You have $#{new_balance} in your account."
            @investor_name.total_balance_in_dollars = new_balance
            @investor_name.save
    end
  end

  def inventor_prompt(input)
    @inventor_name = Inventor.find_or_create_by(name: @user_input)
    if @inventor_name.ideas.count == nil
      puts "Welcome #{@inventor_name.name}! You idea count is:\n0."
    else
      puts "Welcome #{@inventor_name.name}! You idea count is:\n#{@inventor_name.ideas.count}."
    end

  end

  # def investor_investments
  #   idea_arr = []
  #   puts "Would you like to see all of your investments?\n Y/N"
  #   input = gets.to_s
  #   if input == "Y" || "y"
  #     @name.investments.each do |investment|
  #       idea_arr << Idea.find(investment.idea_id).name
  #     end
  #     puts "You have invested in the following ideas:\n#{idea_arr.join("\n")}"
  #   elsif
  #     if input == "N" || "n"
  #       puts ""
  #     end
  #   else
  #     puts "Sorry this is an invalid input"
  #     investor_investments
  #   end
  #
  # end
  #
  # def all_ideas #return all ideas
  #   ideas = Ideas.all
  #   ideas
  #   binding.pry
  # end



  def run
    greeting
    # user_prompt
    invest_or_invent_prompt
    # investor_investments
    # all_ideas
  end
end
