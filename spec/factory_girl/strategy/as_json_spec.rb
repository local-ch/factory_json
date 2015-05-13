
require 'spec_helper'

describe FactoryGirl::Strategy::AsJSON do
  it_should_behave_like "strategy without association support"

  context "Object source" do
    let(:result)     { { "name" => "John Doe", "gender" => "Male", "admin" => false } }
    let(:object)     { stub("user", to_json: result.to_json, ) }
    let(:evaluation) { stub("evaluation", object: object) }

    before(:each) do
      subject.stubs(:build_class_is_hash?).returns(false)
    end

    it "pipes hash through JSON lib" do
      JSON.expects(:parse).with(kind_of(String))

      subject.result(evaluation)
    end

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
    let(:result)     { { "name" => "John Doe", "gender" => "Male", "admin" => false } }
    let(:hash)     { { name: "John Doe", gender: "Male", admin: false } }
    let(:evaluation) { stub("evaluation", hash: hash) }

    before(:each) do
      subject.stubs(:build_class_is_hash?).returns(true)
    end

    it "pipes hash through JSON lib" do
      JSON.expects(:parse).with(kind_of(String))

      subject.result(evaluation)
    end

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