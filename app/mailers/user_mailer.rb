class UserMailer < ActionMailer::Base
    default from: "Harry's <welcome@harrys.com>"

    def signup_email(user)
        @user = user
			@twitter_message = "#yournewsecretweapon Excited for @everpresentapp to launch."

        mail(:to => user.email, :subject => "Thanks for signing up!")
    end
end
