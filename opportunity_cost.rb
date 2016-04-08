

class Activity
  attr_accessor :activity_name, :time_investment, :direct_cost, :satisfaction_index, :activity_cost

  def initialize(activity_name, time_investment, direct_cost, satisfaction_index, activity_cost)

    @activity_name = activity_name
    @time_investment = time_investment
    @direct_cost = direct_cost
    @satisfaction_index = satisfaction_index
    @activity_cost = activity_cost

  end

end

class Calculator

  def initialize
    @activity = {}
    gather_salary_info

  end

  def gather_salary_info

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
    gather_salary_info
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

    @hourly_valuation = (yearly_salary.to_f / 2064)
    puts "Each hour of yours is valued at $#{@hourly_valuation}"

    add_activity

  end

  def add_activity

    puts "What's the name of the activity you'd like to calculate cost for?"
    @activity_name = (gets.chomp.split.map(&:capitalize)*' ')

    time_required

  end

  def time_required

    puts "How many hours of your time does #{@activity_name} require?"

    @time_investment = gets.chomp.to_i

    cost_of_activity

  end

  def cost_of_activity

    puts "How much will you spend on #{@activity_name}?"

    @direct_cost = gets.chomp.to_f

    satisfaction_from_activity

  end

  def satisfaction_from_activity

    puts "If you engage in this activity will you feel a(very happy), b(happy), c(neutral) d(unhappy)?"

    satisfaction_from_activity_input = gets.chomp
    @satisfaction_index = @hourly_valuation

    case satisfaction_from_activity_input
      when "a"
        @satisfaction_index = (@hourly_valuation * -1).to_i
      when "b"
        @satisfaction_index = (@hourly_valuation / 2 * -1).to_i
      when "c"
        @satisfaction_index = 0
      when "d"
        @satisfaction_index = @hourly_valuation
      else
        satisfaction_from_activity
        puts @satisfaction_index
    end

    calculate_cost

  end

  def calculate_cost

    total_of_activity = (@time_investment * @direct_cost).to_i
    @activity_cost = total_of_activity + @satisfaction_index

    create_activity

  end

  def create_activity

    @new_activity = Activity.new(@activity_name,  @time_investment,  @direct_cost, @satisfaction_index, @activity_cost)

    @activity[@activity_name]=@activity_cost

    list_activities

  end

  def list_activities

    puts "Would you like a(add another activity) or r(run a cost calculation)?"
    answer = gets.chomp
    case answer
      when "a"
        add_activity
      when "r"
        cost_calculation
      else
        list_activities
      end

    end

  def cost_calculation

    sorted = @activity.sort_by { |name, cost| cost }.reverse

    current_highest = sorted.shift
    current_lowest = sorted.reverse.shift

    unless current_lowest.nil?
    puts "it costs less to #{current_lowest}"
    end
    puts "it costs more to #{current_highest}"

  end

end

Calculator.new
# movies = Activity.new(Movies, 2, 10, a)
# cleaning = Activity.new(Cleaning, 3, 12, c)
