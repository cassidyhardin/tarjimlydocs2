# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
    def completed_request
        puts "ASHITTTYYY SHIITTTT SHIITTTYYYY"
        RequestMailer.with(claim: Claim.first).completed_request
    end
end
