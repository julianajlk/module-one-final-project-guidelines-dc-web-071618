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
      main_menu_invest
    elsif  @invest_or_invent_input.downcase == "inventor"
      inventor_prompt(@invest_or_invent_input)
      main_menu_invent
    else
      puts "Try again!"
      invest_or_invent_prompt
    end
  end

#INVESTOR
  def investor_prompt(input)
    @investor_name = Investor.find_or_create_by(name: @user_input)
    if @investor_name.total_balance_in_dollars == nil
      puts "Welcome #{@investor_name.name}! You have $0 in your account. How much would you like to add to your account?"
      input_account = gets.to_i
      puts "You have $#{input_account} in your account."
    else
      puts "Welcome #{@investor_name.name}! You have #{@investor_name.total_balance_in_dollars} in your account.How much would you like to add to your account?"
      input_account = gets.to_i
      new_balance = input_account + @investor_name.total_balance_in_dollars
      puts "You have $#{new_balance} in your account."
      @investor_name.total_balance_in_dollars = new_balance
      @investor_name.save
    end
    main_menu_invest
  end

  def main_menu_invest
    puts "MAIN MENU\n"
    puts "Total Balance: #{@investor_name.total_balance_in_dollars}"
    puts "Press 1: See My Investments"
    puts "Press 2: See All Ideas"
    answer = gets.to_i
      if answer == 1
        investor_investments
      elsif answer == 2
        all_ideas_investor
      else
        puts "Sorry, that's not a valid input."
        main_menu_invest
      end
  end

  def back_to_invest_main_menu
    puts "Press 0: Back to Main Menu"
    main = gets.to_i
      if main == 0
        main_menu_invest
      else
        back_to_invest_main_menu
      end
  end

  def all_ideas_investor
    list_of_ideas = Idea.all.map {|n| "#{n.id}. #{n.name}: #{n.description}"}
    puts  list_of_ideas#<- See all ideas
    puts "To invest in an Idea, please type the number for the Idea you'd like to invest in:"
    input_answer = gets.to_i
    find_idea = Idea.all.find(input_answer)
    if find_idea
      puts "How much would you like to invest in this Idea?"
      amount_input = gets.to_i
      puts "Congrats!  You are now the proud investor of the #{find_idea.name} Idea!"
      puts "$#{amount_input} has been deducted from your total and placed into #{find_idea.name}!"
      updated_balance = @investor_name.total_balance_in_dollars - amount_input
      puts "Your new account balance is: $#{updated_balance}.\n Yay!  You're now a Capitalist! You'll be taxed in the next Q1."
      @investor_name.total_balance_in_dollars = updated_balance
      @investor_name.save
      @new_inv = Investment.create(investor_id: @investor_name.id, idea_id: find_idea.id, amount_invested: amount_input)
      puts "Here are the details of your new investment:\nIdea Num: #{Investment.all[-1].idea_id}\nIdea Name: #{find_idea.name}\nAmount Invested: #{Investment.all[-1].amount_invested}"
    else
      puts "Sorry, that's not a valid option."
    end
    back_to_invest_main_menu
  end

  def investor_investments
    investment_arr = []
      @investor_name.investments.each do |investment|
        investment_arr << Idea.find(investment.idea_id).name
      end
      puts "You have invested in the following ideas:\n#{investment_arr.join("\n")}"
      back_to_invest_main_menu
  end

#INVENTOR
  def inventor_prompt(input)
    @inventor = Inventor.find_or_create_by(name: @user_input)
    if @inventor.ideas.count == 0
      puts "Welcome #{@inventor.name}! Let's get started!"
    else
      puts "Welcome back #{@inventor.name}! You idea count is:\n#{@inventor.ideas.count}."
    end
  end

  def main_menu_invent
    puts "MAIN MENU\n"
    puts "Press 1: See My Ideas"
    puts "Press 2: See All Ideas"
    puts "Press 3: See My Ideas that have Investors"
    puts "Press 4: Create an Idea"
    answer1 = gets.to_i
      if answer1 == 1
        if @inventor.ideas == nil
          puts "Your idea count is 0."
        else
          puts @inventor.ideas.map {|n| "#{n.name}: #{n.description}"}
        end
      back_to_invent_main_menu
      elsif answer1 == 2
        all_ideas_inventor
      elsif answer1 == 3
        inventor_invested_ideas
      elsif answer1 == 4
        gets_idea_input
      else
        puts "Sorry, that's not a valid input."
        main_menu_invent
      end
  end

  def back_to_invent_main_menu
    puts "Press 0: Back to Main Menu"
    main = gets.to_i
      if main == 0
        main_menu_invent
      else
        back_to_invent_main_menu
      end
  end

  def all_ideas_inventor
    puts Idea.all.map {|n| "#{n.name}: #{n.description}"} #<- See all ideas
    back_to_invent_main_menu
  end

  def inventor_invested_ideas
    idea_arr = []
      @inventor.investments.each do |investment|
        idea_arr << Idea.find(investment.idea_id).name
      end
    puts "The following Ideas have investments:\n#{idea_arr.uniq.join("\n")}"
    back_to_invent_main_menu
  end

  #CREATE_IDEA
  def gets_idea_input
    puts "What's the name of the invention did you want to create?"
    @idea_input = gets.chomp
    create_idea(@idea_input)
    main_menu_invent
  end

  def create_idea(name)
    @idea_name = Idea.find_or_create_by(name: @idea_input, inventor_id: @inventor.id)
    if @idea_name.description == nil
      puts "Please describe what your invention does:\n"
      description_input = gets.chomp
      @idea_name.description = description_input
      @idea_name.save
    else
      puts "hi"
    end
  end

  def run
    greeting
    invest_or_invent_prompt
  end
end
