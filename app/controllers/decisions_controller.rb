class DecisionsController < ApplicationController

  def new
    @decision = Decision.new
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
