require 'rails_helper'

RSpec.describe "phone_numbers/new", type: :view do
  let(:company) { Company.create(name: 'Tyrell Corporation')}
  let(:phone_number) { PhoneNumber.new(contact_id: company.id, contact_type: 'Company', number: '555-777-5579')}
  before(:each) { assign(:phone_number, phone_number) }

  it "renders new phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_numbers_path, "post" do

      assert_select "input#phone_number_number[name=?]", "phone_number[number]"

      assert_select "input#phone_number_contact_id[name=?]", "phone_number[contact_id]"
    end
  end
  it "shows the contact's name in the title" do
    render
    assert_select 'h1', text: "New Phone Number for #{phone_number.contact}"
  end
end
