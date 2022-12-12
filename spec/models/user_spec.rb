require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      first_name: 'Alexandr',
      last_name: 'Kozhuhar',
      phone: '000-00-00',
      email: 'kozhukhargay@email.com',
    )
  end

  fit 'stores data correctly', :fast do
    expect(user.email).to eq('kozhukhargay@email.com')
  end

  fit 'stores data correctly', :fast do
    expect(user.email).to eq('kozhukhargay@email.com')
  end
end
