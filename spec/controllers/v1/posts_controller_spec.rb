require 'rails_helper'

RSpec.describe V1::PostsController, type: :controller do
  describe "#create" do
    subject { post :create, params: post_params }

    context "with valid params" do
      let(:post_params) do
        {
            author_login: "test",
            author_ip: "0.0.0.0",
            content: "Hello, world!",
            title: "Greetings"
        }
      end

      it "success" do
        expect(subject).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      let(:post_params) do
        {
            author_login: "test",
            author_ip: "0.0.0.0",
            content: "Hello, world!"
        }
      end

      it "failed" do
        expect(subject).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "#rate" do
    let(:record) { create(:post) }
    subject { post :rate, params: params.merge(id: record.id) }

    context "with valid rate" do
      let(:params) { {value: 2} }

      it "success" do
        expect(subject).to have_http_status(:ok)
      end
    end

    context "with invalid rate" do
      let(:params) { {value: 200} }

      it "success" do
        expect(subject).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "#popular_author_ips" do
    subject { get :popular_author_ips }

    it "returns ok" do
      expect(subject).to have_http_status(:ok)
    end
  end
end
