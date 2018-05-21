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

      context "when author_ip is not stored" do
        it 'creates author_ip' do
          expect { subject }.to change { AuthorIp.count }.from(0).to(1)
        end
      end

      context "when author_ip has already stored" do
        before :each do
          create(:author_ip, ip: "0.0.0.0", logins: ["test2"])
        end

        it "does not save author ip" do
          expect { subject }.to_not change { AuthorIp.count }.from(1)
        end

        it "adds login int login array" do
          expect { subject }.to change { AuthorIp.take.logins }.from(["test2"]).to(["test2", "test"])
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