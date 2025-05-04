class HomesController < ApplicationController
  skip_before_action :authenticate_current_user!

  def index
    @fitness_plans = FitnessPlan.all
  end

  def about_us
  end

  def gallery
  end

  def schedule
  end
end
