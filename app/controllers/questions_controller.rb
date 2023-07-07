class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]

  def create
    question_params = params.require(:question).permit(:body, :user_id)

    @question = Question.create(question_params)
    @question.author = current_user

    if QuestionSave.call(question: @question, params: question_params)
      redirect_to user_path(@question.user.nickname), notice: "Новый вопрос создан!"
    else
      @user = @question.user
      flash.now[:alert] = "Нужно задать вопрос!"
      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)

    if QuestionSave.call(question: @question, params: question_params)
      redirect_to user_path(@question.user.nickname), notice: "Сохранили вопрос!"
    else
      flash.now[:alert] = "Ошибка при редактировании вопроса, нужно записать заново"
      render :edit
    end
  end

  def hide
    @question.update(hidden: true)
    redirect_to questions_path, notice: "Скрыли вопрос!"
  end

  def destroy
    @user = @question.user
    @question.destroy
    redirect_to user_path(@user), notice: "Удалили вопрос!"
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.order(created_at: :desc).first(10)
    @users = User.order(created_at: :desc).first(10)
    @hashtags = Hashtag.with_questions.order(created_at: :desc).first(10)
  end

  def new
    @user = User.find_by!(nickname: params[:nickname])
    @question = Question.new(user: @user)
  end

  def edit
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
