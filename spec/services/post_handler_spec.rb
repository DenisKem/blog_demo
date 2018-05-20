require 'rails_helper'

RSpec.describe PostHandler do
  subject { PostHandler.perform(params) }

  describe "::perform" do
    context "with valid params" do
      let(:login) { "test" }
      let(:params) do
        {
            author_login: login,
            author_ip: "0.0.0.0",
            content: "Hello, world!",
            title: "Greetings"
        }
      end

      it "creates post" do
        expect { subject }.to change { Post.count }.from(0).to(1)
      end

      context "when author does not exists" do
        it "creates new author" do
          expect { subject }.to change { User.count }.from(0).to(1)
        end
      end

      context "when author exists" do
        before :each do
          create(:user, login: login)
        end

        it "does not creates new author" do
          expect { subject }.to_not change { User.count }.from(1)
        end
      end
    end

    shared_examples_for :failing do
      it do
        expect { subject }.to_not change { Post.count }.from(0)
      end
    end

    context "when title is missing" do
      let(:params) do
        {
            author_login: "test",
            author_ip: "0.0.0.0",
            content: "Hello, world!"
        }
      end

      it_behaves_like :failing
    end

    context "when content is missing" do
      let(:params) do
        {
            author_login: "test",
            author_ip: "0.0.0.0",
            title: "Greetings"
        }
      end

      it_behaves_like :failing
    end
  end
end