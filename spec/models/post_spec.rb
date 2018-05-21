require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "::popular_author_ips" do
    subject { Post.popular_author_ips }

    before :each do
      create(:post, author_ip: "127.0.0.2")
      create(:post, author_ip: "127.0.0.2")
      create(:post, author_ip: "127.0.0.3")
    end

    it "returns only 127.0.0.2" do
      expect(subject.size).to eq(1)
      expect(subject.first.keys).to eq(["127.0.0.2"])
    end

    it "returns two authors" do
      expect(subject.first["127.0.0.2"].size).to eq(2)
    end
  end
end
