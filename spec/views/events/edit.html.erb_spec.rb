require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "textarea#event_content[name=?]", "event[content]"
    end
  end
end
