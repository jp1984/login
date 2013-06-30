require "spec_helper"

describe User do
  describe "Devise Attributes" do
    it { should have_fields(:email, :encrypted_password).
      of_type(String).with_default_value_of("") }

    it { should have_fields(:reset_password_token,
      :current_sign_in_ip, :last_sign_in_ip).of_type(String) }
    it { should have_fields(:reset_password_sent_at,:remember_created_at,
      :current_sign_in_at, :last_sign_in_at).of_type(Time) }
    it { should have_field(:sign_in_count).of_type(Integer).
      with_default_value_of(0) }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }

  end
end
