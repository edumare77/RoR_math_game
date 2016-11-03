class WelcomeController < ApplicationController
  def home
    @arithmetic = current_user.arithmetics.build if logged_in?
  end
end
