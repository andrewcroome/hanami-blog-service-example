RSpec.describe API::MyClass, "#call" do
  subject(:my_class) { described_class.new(logger: logger, create: create) }

  let(:logger) { double(:logger) }
  let(:create) { double(:create) }

  it "logs input and calls create" do
    expect(logger).to receive(:info).with "I received some input"
    expect(create).to receive(:call).with "some input"

    my_class.call("some input")
  end
end
