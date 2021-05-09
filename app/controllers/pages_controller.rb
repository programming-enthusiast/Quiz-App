class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @quizzes = Quiz.published
  end
end
