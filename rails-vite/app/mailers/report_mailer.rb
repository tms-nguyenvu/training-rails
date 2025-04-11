class ReportMailer < ApplicationMailer
  def send_report
    @post = params[:post]
    @reporter = params[:reporter]

    mail(
      to: "vu.nguyen1.tms@gmail.com",
      from: @reporter.email,
      subject: "Report post ##{@post.id}"
    )
  end
end
