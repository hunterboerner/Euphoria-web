require 'spec_helper'

describe User do
  before do
    @user = User.new({ :email                 => "user@example.com",
                       :password              => 'foobarbatman',
                       :password_confirmation => 'foobarbatman',
                       :username              => 'user' })
    @user.skip_confirmation!
    @user.save!
  end

  subject { @user }

  it { should respond_to(:login) }

  describe "when name is not present" do
    before { @user.username = ' ' }
    it { should_not be_valid }
  end
end
