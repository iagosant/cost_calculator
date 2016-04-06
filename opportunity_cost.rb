

class Activity
  attr_accessor :activity_name, :time_investment, :direct_cost, :satisfaction_index

    def initialize

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

      hourly_valuation = (yearly_salary.to_f / 2064)
      puts "Each hour of yours is valued at $#{hourly_valuation}"
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

      puts "If you engage in this activity will you feel a(very happy), b(neutral), c(not happy)?"

      satisfaction_from_activity_input = gets.chomp
      @satisfaction_index = 0

      case satisfaction_from_activity_input
      when "a"
        @satisfaction_index = 3
      when "b"
        @satisfaction_index = 2
      when "c"
        @satisfaction_index = 1
      else
        satisfaction_from_activity
      end
      create_activity

    end

    def create_activity

      @activity = [@activity_name,  @time_investment,  @direct_cost, @satisfaction_index ]

      puts @activity[time_investment]
      # puts @activity.time_investment

      list_activities

    end

    def list_activities
      puts "These are the activities you'd like to calculate cost for:"
      @activity.each do |activity|
        puts activity[activity_name]
      end
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
  end

  def cost_calculation
    puts "This method calculates cost for activities."
  end

Activity.new
