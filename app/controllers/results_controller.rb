class ResultsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  def new
  end
  
 
end
