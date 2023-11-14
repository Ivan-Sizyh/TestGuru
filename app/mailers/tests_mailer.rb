class TestsMailer < ApplicationMailer
  def completed_test(result)
    @user = result.user
    @test = result.test
    @result = result

    if result.successful?
      mail to: @user.email, subject: "Вы прошли тест на TestGuru удачно!"
    else
      mail to: @user.email, subject: "Вы прошли тест на TestGuru не удачно!"
    end
  end
end
