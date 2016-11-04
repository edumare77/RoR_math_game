class WelcomeController < ApplicationController
  def home
    @arithmetic = current_user.arithmetic.build if logged_in?
  end
end
