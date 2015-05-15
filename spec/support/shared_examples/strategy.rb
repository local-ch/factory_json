shared_examples_for "strategy with association support" do |factory_girl_strategy_name|
  let(:factory) { stub("associate_factory") }

  def association_named(name, strategy, overrides)
    runner = FactoryGirl::FactoryRunner.new(name, strategy, [overrides])
    subject.association(runner)
  end

  before do
    FactoryGirl.stubs(factory_by_name: factory)
    factory.stubs(:compile)
    factory.stubs(:run)
  end

  it "runs the factory with the correct overrides" do
    association_named(:author, factory_girl_strategy_name, great: "value")
    expect(factory).to have_received(:run).with(factory_girl_strategy_name, great: "value")
  end

  it "finds the factory with the correct factory name" do
    association_named(:author, factory_girl_strategy_name, great: "value")
    expect(FactoryGirl).to have_received(:factory_by_name).with(:author)
  end
end

shared_examples_for "strategy with strategy: :build" do |factory_girl_strategy_name|
  let(:factory) { stub("associate_factory") }

  def association_named(name, overrides)
    runner = FactoryGirl::FactoryRunner.new(name, overrides[:strategy], [overrides.except(:strategy)])
    subject.association(runner)
  end

  before do
    FactoryGirl.stubs(factory_by_name: factory)
    factory.stubs(:compile)
    factory.stubs(:run)
  end

  it "runs the factory with the correct overrides" do
    association_named(:author, strategy: :build, great: "value")
    expect(factory).to have_received(:run).with(factory_girl_strategy_name, { great: "value" })
  end

  it "finds the factory with the correct factory name" do
    association_named(:author, strategy: :build, great: "value")
    expect(FactoryGirl).to have_received(:factory_by_name).with(:author)
  end
end

shared_examples_for "strategy with callbacks" do |result_instance, *callback_names|
  let(:object) {{}}
  let(:evaluation) { stub("evaluation", object: object, notify: true, create: nil) }

  it "runs the callbacks #{callback_names} with the evaluation's object" do
    subject.result(evaluation)
    callback_names.each do |name|
      expect(evaluation).to have_received(:notify).with(name, evaluation.object)
    end
  end

  it "returns the object from the evaluation" do
    expect(subject.result(evaluation)).to eq result_instance
  end
end
