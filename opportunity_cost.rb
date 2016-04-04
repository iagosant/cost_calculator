
def frequency
puts "Do you get paid a(once a week) b(once every two weeks) c(once per month)?"
@schedule = gets.chomp
case @schedule
when "a"
  once_a_week
when "b"
  every_two_weeks
when "c"
  once_per_month
else
  frequency
  end
end

def once_a_week
  puts "How much do you get paid once a week?"
  salary_per_week = gets.chomp.to_i
  yearly_salary = (salary_per_week * 4.3 * 12).to_i
  puts "Your yearly salary is $#{yearly_salary}"
  hourly_valuation(yearly_salary)
end

def hourly_valuation(yearly_salary)
  hourly_valuation = (yearly_salary.to_f / 2064)
  puts "Each hour of yours is valued at $#{hourly_valuation}"
  opportunity_cost(hourly_valuation)
end

def opportunity_cost(hourly_valuation)
  puts "What activity do you wish to calculate?"
  activity = gets.chomp
  puts "How many hours will #{activity} take?"
  time_investment = gets.chomp.to_f
  cost_of_activity = (hourly_valuation * time_investment).to_f
  puts "The time investment for #{activity} is $#{cost_of_activity}"
end

frequency
