class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @users = User.excluding(current_user)
    @decisions = Decision.where(user_id: current_user)
  end

  def matches
    @decisions = Decision.where("user_id = ? or user_2 = ?", "#{current_user.id}", "#{current_user.id}")
    @matches = @decisions.where("likes = ? and likes2 = ?", "true", "true")
  end

end
