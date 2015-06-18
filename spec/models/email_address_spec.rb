require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:test_person) { Person.create(first_name: 'Tessa', last_name: "Testy")}
  let(:email_address) { EmailAddress.new(address: 'tessa@testy.com', contact_id: test_person.id, contact_type: 'Person')}

  it 'is valid' do
    expect(email_address).to be_valid
  end
  it 'is invalid without an address' do
    email_address.address = nil
    expect(email_address).to_not be_valid
  end
  it 'is invalid without an associated contact' do
    email_address.contact_id = nil
    expect(email_address).to_not be_valid
  end
end
