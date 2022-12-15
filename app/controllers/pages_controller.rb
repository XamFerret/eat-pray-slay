class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
  end

  def matchmaker
    @users = User.excluding(current_user)
  end

end

# => users = User.where.not(id: current_user.id)
# @decision = Decision.where(["user_id = ? and user_2 = ?", "#{params[:user]}", "#{current_user}"])

# @users = User.where.not()
