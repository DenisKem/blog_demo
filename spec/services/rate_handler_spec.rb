require 'rails_helper'

RSpec.describe RateHandler do
  describe "::perform" do
    let(:post_record) { create(:post) }
    subject { RateHandler.perform(post_record, {value: value}) }

    shared_examples_for :failing do
      it "does not save rate" do
        expect { subject }.to_not change { Rate.count }.from(0)
      end

      it "does not update average_rates" do
        expect { subject; post_record.reload }.to_not change { post_record.average_rate }.from(0)
      end
    end

    context "with rate is less than 1" do
      let(:value) { 0 }
      it_behaves_like :failing
    end

    context "with rate is great than 5" do
      let(:value) { 6 }
      it_behaves_like :failing
    end

    context "with rate equals 3" do
      let(:value) { 3 }

      before :each do
        RateHandler.perform(post_record, value: 5)
        post_record.reload
      end

      it "saves rate" do
        expect { subject }.to change { Rate.count }.from(1).to(2)
      end

      it "updates average rate" do
        expect { subject; post_record.reload }.to change { post_record.average_rate}.from(5).to(4)
      end
    end
  end
end