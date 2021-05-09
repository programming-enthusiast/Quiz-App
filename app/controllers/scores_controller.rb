class ScoresController < ApplicationController
  def index
    @scores = current_user.scores
    @students = User.where(is_teacher: false).order(created_at: :desc)
  end

  def create
    @score = Score.find_by(quiz_id: score_params[:quiz_id], user_id: current_user.id)
    if !@score
      @score = Score.new(score_params.merge(user: current_user))
      @score.save
    else
      @score.update(score_params.merge(user: current_user))
    end
  end

  def score_params
    params.require(:score).permit(:quiz_id, :score)
  end
end
