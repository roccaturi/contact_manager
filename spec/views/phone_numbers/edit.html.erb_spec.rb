require 'rails_helper'

RSpec.describe "phone_numbers/edit", type: :view do
  let(:company) { Company.create(name: 'Crimson Permanent Assurance')}
  let(:phone_number) { PhoneNumber.create(contact_id: company.id, contact_type: 'Company', number: '555-555-5543')}
  before(:each) { assign(:phone_number, phone_number) }

  it "renders the edit phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_number_path(phone_number), "post" do

      assert_select "input#phone_number_number[name=?]", "phone_number[number]"

      assert_select "input#phone_number_contact_id[name=?]", "phone_number[contact_id]"
    end
  end
  it "shows the phone number and the contact's name in the title" do
    render
    assert_select 'h1', text: "Editing #{phone_number.number} for #{phone_number.contact}"
  end
end
