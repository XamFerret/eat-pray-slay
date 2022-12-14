class DecisionsController < ApplicationController
  before_action :decision_check?, only: %i[swipe_right]

  def new
    @decision = Decision.new
  end

  def create
    @decision = Decision.new
    @decision.user = current_user
    @decision.user2 = User.find(params[:user])
    @decision.save!
  end

  def swipe_right
    if decision_check?
      update
    else
      create
    end
  end

  def update
    @decision = Decision.where(["user_id = ? and user_2 = ?", "#{params[:user]}", "#{current_user}"])
    @decision.likes2 = true
    if @decision.likes == true && @decision.likes2 == true
      create_match
    end
  end

  def create_match
    @match = Match.new
    @match.decision = @decision
    @match.save!
  end

  private

  def decision_check?
    @decision = Decision.where(["user_id = ? and user_2 = ?", "#{params[:user]}", "#{current_user}"])
    @decision.present?
  end

end
