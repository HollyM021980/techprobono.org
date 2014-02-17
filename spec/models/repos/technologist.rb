require 'spec_helper'

describe Repos::Technologist do

  let(:form_params) do
    {
      twitter: "techprobono",
      github: "techprobono",
      email: "techprobono@email.com",
      portfolio: "techprobono.org",
      skills: "html,ruby"
    }
  end

  let(:rails_params) do
    {
      contacts_attributes: [{contact_type: "twitter", value: "techprobono"},
                            {contact_type: "github", value: "techprobono"},
                            {contact_type: "portfolio", value: "techprobono.org"}],
      email: "techprobono@email.com",
      skills: ["html", "ruby"],
      account_type: Repos::Technologist::ACCOUNT_TYPE
    }
  end

  it "converts client params to rails format" do
    tech = Repos::Technologist.new
    expect(tech.parse_params(form_params)).to eql rails_params
  end
end
