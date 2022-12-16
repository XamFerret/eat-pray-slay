class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @users = User.excluding(current_user)
    @decisions = Decision.where(user_id: current_user)
  end

  def next_user
    @decisions = Decision.where(user_id: current_user)
    @decisions.each do |decision|
      
    end
  end

  <% @decisions.each do |decision| %>
    <% user_2 << decision.user_2 %>
    <% all_users = User.where.not(id: user_2).and(User.where.not(id: current_user.id)) %>
    <% @user_decision = all_users.sample%>
  <% end %>

  def matches
    @decisions = Decision.where("user_id = ? or user_2 = ?", "#{current_user.id}", "#{current_user.id}")
    @matches = @decisions.where("likes = ? and likes2 = ?", "true", "true")
  end

end
