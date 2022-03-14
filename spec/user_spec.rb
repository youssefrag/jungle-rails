require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
  end

  describe 'Validations' do
    context "User saves correctly" do
      it "does not save is password is missing" do
        @user = User.new(first_name: 'Jimmy', last_name: 'Smith', email: 'jimmysmith@gmail.com', password: '', password_confirmation: 'example')
        expect(@user.save).to be false
      end
      it "does not save is password confirmation is missing" do
        @user = User.new(first_name: 'Jimmy', last_name: 'Smith', email: 'jimmysmith@gmail.com', password: 'example', password_confirmation: '')
        expect(@user.save).to be false
      end
      it 'saves when password and confirmation are matching' do
        @user = User.new(first_name: 'Jimmy', last_name: 'Smith', email: 'jimmysmith@gmail.com', password: 'example', password_confirmation: 'example')
        expect(@user.save).to be true
      end
      it 'does not save if first name is missing' do
        @user = User.new(first_name: '', last_name: 'Smith', email: 'jimmysmith@gmail.com', password: 'example', password_confirmation: 'example')
        expect(@user.save).to be false
      end
      it 'does not save if last name is missing' do
        @user = User.new(first_name: 'Jimmy', last_name: '', email: 'jimmysmith@gmail.com', password: 'example', password_confirmation: 'example')
        expect(@user.save).to be false
      end
      it 'does not save if email is missing' do
        @user = User.new(first_name: 'Jimmy', last_name: 'Smith', email: '', password: 'example', password_confirmation: 'example')
        expect(@user.save).to be false
      end
      it 'does not save if email already exists' do
        @user = User.new(first_name: 'Jimmy', last_name: 'Smith', email: 'jimmysmith@gmail.com', password: 'example', password_confirmation: 'example')
        @user.save
        @user2 = User.new(first_name: 'Jimmy', last_name: 'Smith', email: 'jimmysmith@gmail.com', password: 'example', password_confirmation: 'example')
        expect(@user2.save).to be false
      end
    end
  end
end