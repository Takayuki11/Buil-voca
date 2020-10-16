class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
  #----------変更点--------------
      to:   'taka.ymgc.11@gmail.com',
  #----------変更点ここまで---------
      subject: 'お問い合わせ通知'
    )
  end
end
