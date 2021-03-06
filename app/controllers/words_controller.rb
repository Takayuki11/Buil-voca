class WordsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only:[:edit]
  
  # 今回はeikenとtoeicでルーティングを組んだので無視
  # もし英検とTOEICの単語をindexページだけで作りたいときは<link>でパラメーターを飛ばしてあげてそのパラメータで条件文を作る
  # def index
  #   if params[:eiken] == "eiken"
  #     @eiken_words = Word.where(eiken: true).page(params[:page]).per(30)
  #     @toeic_words
  #   elsif params[:toeic] == "toeic"
  #     @eiken_words
  #     @toeic_words = Word.where(toeic: true).page(params[:page]).per(30)
  #   end
  # end
  
  def eiken
    @eiken_words = Word.where(eiken: true).page(params[:page]).per(30)
  end
  
  def toeic
    @toeic_words = Word.where(toeic: true).page(params[:page]).per(30)
  end
  
  def confirmation
    word_size = 10
    @eiken_words = Word.where(eiken: true).where( 'id >= ?', rand(Word.first.id..Word.last.id - word_size) ).limit(word_size)
    @toeic_words = Word.where(toeic: true).where( 'id >= ?', rand(Word.first.id..Word.last.id - word_size) ).limit(word_size)
    @number = [1,2,3,4,5,6,7,8,9,10]
  end
  
  def show
    @word = Word.find(params[:id])
  end

  def create
    @user = current_user
    @word = current_user.words.build(word_params)
      
    if @word.save
      flash[:success] = '新しい単語を作成しました。'
      redirect_to @user
    else
      flash.now[:danger] = '単語の登録に失敗しました。'
      render "users/show"
    end
  end

  def edit
    @word = Word.find(params[:id])
  end
  
  def update
    @word = Word.find(params[:id])
    if @word.update(edit_params)
      flash[:success] = "単語の編集に成功しました。 "
      redirect_to @word
    else
      flash.now[:danger] = "単語の編集に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    flash[:success] = "単語を削除しました。 "
    if @word.eiken == true
      redirect_to eiken_words_path
    else
      redirect_to toeic_words_path
    end
  end
  
  private
  
  def correct_user
    @word = current_user.words.find_by(id: params[:id])
    unless @word
      redirect_to root_url
    end
  end
  
  def word_params
    params.require(:word).permit(:content, :meaning, :example, :translation, :eiken, :toeic)
  end
  
  def edit_params
    params.require(:word).permit(:content, :meaning, :example, :translation)
  end
end
