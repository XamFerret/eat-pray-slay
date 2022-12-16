class DecisionsController < ApplicationController

  def new
    @decision = Decision.new
  end

  def refresh_users
    @decisions = Decision.where(user_id: current_user)
    user_2 = []
    @user_decision = []
    if @decisions.empty?
      all_users = User.excluding(current_user)
      @user_decision = all_users.sample
    else
      @decisions.each do |decision|
      user_2 << decision.user_2
      all_users = User.where.not(id: user_2).and(User.where.not(id: current_user.id))
      @user_decision = all_users.sample
      end
    end
  end

  def swipe_right
    if decision_check?
      update_right
    else
      create_right
    end
  end

  def create_right
    @decision = Decision.new
    @decision.user = current_user
    @decision.user_2 = params[:user]
    @decision.likes = true
    @decision.save!
    refresh_users
    redirect_to user_path(@user_decision)

  end

  def update_right
    @decision = Decision.where(["user_id = ? and user_2 = ?", "#{params[:user]}", "#{current_user.id}"]).first
    @decision.likes2 = true
    @decision.save
    if @decision.likes == true && @decision.likes2 == true
      create_match
    end
  end

  def swipe_left
    if decision_check?
      update_left
    else
      create_left
    end
  end

  def create_left
    @decision = Decision.new
    @decision.user = current_user
    @decision.user_2 = params[:user]
    @decision.likes = false
    @decision.save!
  end

  def update_left
    @decision = Decision.where(["user_id = ? and user_2 = ?", "#{params[:user]}", "#{current_user.id}"]).first
    @decision.likes2 = false
    @decision.save
  end

  def create_match
    @match = Match.new
    @match.decision = @decision
    @match.save!
  end

  private
  def decision_check?
    @decision = Decision.where(["user_id = ? and user_2 = ?", "#{params[:user]}", "#{current_user.id}"]).first
    @decision.present?
  end
end
