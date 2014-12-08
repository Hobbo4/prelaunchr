class User < ActiveRecord::Base
		establish_connection PRIMARY_DB_CONFIG
		establish_connection SECONDARY_DB_CONFIG
    belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "User", :foreign_key => "referrer_id"
    
    attr_accessible :email

    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." }
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code
    after_create :send_welcome_email
	

    REFERRAL_STEPS = [
        {
            'count' => 5,
					"html" => "One Month<br>Free Everpresent",
            "class" => "two",
            "image" =>  ActionController::Base.helpers.asset_path("refer/1month.png")
        },
        {
            'count' => 10,
					"html" => "Three Months<br>+ Love",
            "class" => "three",
            "image" => ActionController::Base.helpers.asset_path("refer/2months@2x.png")
        },
        {
            'count' => 25,
					"html" => "Six Months<br>+ Love<br>+ Course",
            "class" => "four",
            "image" => ActionController::Base.helpers.asset_path("refer/6months@2x.png")
        },
        {
            'count' => 50,
					"html" => "Two Years<br>+ Love<br>+ Course (x2)<br>+ Recognition",
            "class" => "five",
					"image" => ActionController::Base.helpers.asset_path("refer/2years@2x.png")
        }
    ]

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = User.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = User.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end

    def send_welcome_email
        UserMailer.delay.signup_email(self)
    end
		
end
