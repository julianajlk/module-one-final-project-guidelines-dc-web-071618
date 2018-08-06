#Inventors
billy = Inventor.create(name: "Billy", company: "Berry Inc.")
sally = Inventor.create(name: "Sally", company: "Sitwell LLC.")

#Investors
moneybags = Investor.create(name: "Monty Moneybags", company: "Moneybags Inc.", total_balance_in_dollars: 1000000)
peach = Investor.create(name: "Miss Peach", company: "Peach Pals", total_balance_in_dollars: 500000)

#Ideas
egg_pealer = Idea.create(name: "Automatic Egg Shell Pealer", description: "Peals your eggs, so you don't have to!", inventor_id: 1, investor_id: nil)
robot = Idea.create(name: "Robot Dog Walker", description: "Walks your dog, so you don't have to!", inventor_id: 2, investor_id: nil)

#Investments
investment_1 = Investment.create(idea_id: 1, investor_id: 2, amount_invested: 10000)
investment_2 = Investment.create(idea_id: 2, investor_id: 1, amount_invested: 5000)
investment_3 = Investment.create(idea_id: 1, investor_id: 2, amount_invested: 5000)



puts 'seeded'
