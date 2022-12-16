class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @users = User.excluding(current_user)
  end

  def matchmaker
    @users = User.excluding(current_user)
  end

  def matches
    @decisions = Decision.where("user_id = ? or user_2 = ?", "#{current_user.id}", "#{current_user.id}")
    raise
    @matches = Match.where
  end

end

# => users = User.where.not(id: current_user.id)
# @decision = Decision.where(["user_id = ? and user_2 = ?", "#{params[:user]}", "#{current_user}"])

# @users = User.where.not()
