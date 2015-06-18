require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  let(:person) { Person.create(first_name: 'Adam', last_name: 'Jones')}
  let(:email_address) { EmailAddress.create(contact_id: person.id, contact_type: 'Person', address: 'adamj@venture.com')}
  before(:each) { assign(:email_address, email_address) }

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(email_address), "post" do

      assert_select "input#email_address_address[name=?]", "email_address[address]"

      assert_select "input#email_address_contact_id[name=?]", "email_address[contact_id]"
    end
  end
  it "shows the email address and contact's name in the title" do
    render
    assert_select 'h1', text: "Editing #{email_address.address} for #{email_address.contact.first_name} #{email_address.contact.last_name}"
  end
end
