class HashtagsController < ApplicationController
  def show
    begin
      hashtag = Hashtag.with_questions.find_by!(body: params[:body].downcase)
      @questions = hashtag.questions.includes(:user, :author)
    rescue ActiveRecord::RecordNotFound => e
      redirect_to root_path, alert: "Нет такого хэштега!"
    end
  end
end