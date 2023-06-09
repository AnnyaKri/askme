class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.with_questions.find_by!(body: params[:body].downcase)
    @questions = @hashtag.questions.includes(:user, :author)
  end
end