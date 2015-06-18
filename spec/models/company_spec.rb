require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { Company.new(name: 'Yoyodyne')}

  it 'is valid' do
    expect(company).to be_valid
  end
  it 'is invalid without a name' do
    company.name = nil
    expect(company).to_not be_valid
  end
  it 'responds with its created phone numbers' do
    phone_number = company.phone_numbers.build(number: '444-5555')
    expect(phone_number.number).to eq('444-5555')
  end
  it 'responds with its created email addresses' do
    email_address = company.email_addresses.build(address: 'you@example.net')
    expect(email_address.address).to eq('you@example.net')
  end
  it 'converts to a str' do
    expect(company.to_s).to eq('Yoyodyne')
  end
end
