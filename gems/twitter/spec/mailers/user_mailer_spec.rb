require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let!(:user) { create(:user, name: 'Danila', email: 'danila_babanov@yahoo.com') }
    let!(:mail) { UserMailer.account_activation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq(["danila_babanov@yahoo.com"])
      expect(mail.from).to eq(["me@danilababanov.ovh"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "password_reset" do
    let(:mail) { UserMailer.password_reset }

    it "renders the headers" do
      #expect(mail.subject).to eq("Password reset")
      #expect(mail.to).to eq(["danila_babanov@yahoo.com"])
      #expect(mail.from).to eq(["me@danilababanov.ovh"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
