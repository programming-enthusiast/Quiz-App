class QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_quiz
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    authorize @quiz, :show?
    @questions = @quiz.questions
  end

  def show
  end

  def new
    authorize @question = @quiz.questions.build
  end

  def edit
  end

  def create
    authorize @question = @quiz.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html {
          redirect_to quiz_questions_url(@question.quiz), notice: 'Question was successfully created.'
        }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html {
          redirect_to quiz_questions_url(@question.quiz), notice: 'Question was successfully updated.'
        }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html {
        redirect_to quiz_questions_url(@question.quiz), notice: 'Question was successfully destroyed.'
      }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_question
    authorize @question = @quiz.questions.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:text)
  end
end
