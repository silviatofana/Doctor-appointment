require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Felix Okinyo', password: '123456', password_confirmation: '123456', email: 'felixoo@gmail.com',
                role: 'admin', gender: 'M')
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'Name should be valid' do
      expect(subject).to be_valid
    end

    it 'Name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Email should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'Role should be present' do
      subject.role = nil
      expect(subject).to be_valid
    end

    it 'Password confirmation should be same as password' do
      expect(subject.password).to eq(subject.password_confirmation)
    end
  end
end
