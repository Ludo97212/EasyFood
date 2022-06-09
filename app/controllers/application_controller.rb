class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:homepage, :index, :show]
end
