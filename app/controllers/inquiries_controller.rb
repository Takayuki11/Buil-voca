class InquiriesController < ApplicationController
  def new 
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver
      flash[:success] = "メールを送信しました。 "
      redirect_to new_inquiry_path
    else
      flash.now[:danger] = "メールの送信に失敗しました。"
      render :new
    end
  end
  
  private
  
  def inquiry_params
    params.require(:inquiry).permit(:name, :message)
  end
end
