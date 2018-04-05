require 'spec_helper'

describe FactoryBot::Strategy::JSON do
  it_should_behave_like "strategy with association support", :build
  it_should_behave_like "json strategy with callbacks", "{}", :after_build, :before_json
  it_should_behave_like "strategy with strategy: :build", :build

  context "Object source" do
    let(:result)     { { "name" => "John Doe", "gender" => "Male", "admin" => false }.to_json }
    let(:object)     { stub("user", to_json: result) }
    let(:evaluation) { stub("evaluation", object: object, notify: true) }

    it "returns to_hash from the evaluation for an object" do
      expect(subject.result(evaluation)).to eq(result)
    end

    it "does not run the to_create block" do
      expect do
        subject.result(evaluation)
      end.to_not raise_error
    end
  end

  context "Hash source" do
    let(:result)     { { "name" => "John Doe", "gender" => "Male", "admin" => false }.to_json }
    let(:hash)       { { name: "John Doe", gender: "Male", admin: false } }
    let(:evaluation) { stub("evaluation", object: hash, notify: true) }

    it "returns the hash from the evaluation" do
      expect(subject.result(evaluation)).to eq result
    end

    it "does not run the to_create block" do
      expect do
        subject.result(evaluation)
      end.to_not raise_error
    end
  end
end
