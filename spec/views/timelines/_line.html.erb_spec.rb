require 'rails_helper'
RSpec.describe "timelines/_line.html.erb" do
  let(:post) { create(:post, :with_replies) }

  before do
    render "timelines/line", post: post
  end
  subject { Nokogiri::HTML(rendered) }
  it "can be rendered" do
    expect(subject.css(".line").count).to eq 3
    expect(subject.css(".replies .line").count).to eq post.replies.count
    expect(subject.css(".line .identifier"))
      .not_to be_empty
  end
end