class PlayController < ApplicationController
  before_action :set_quiz

  def show
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
