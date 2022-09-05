RSpec.describe API::Posts::Validation::Contract do
  subject(:contract) { described_class.new }

  context "with valid input" do
    let(:input) do
      {title: "title", body: "body", published_from: "2022-12-10T13:45:00.000Z"}
    end

    it "returns success" do
      result = contract.(input)

      expect(result).to be_success
    end
  end

  context "with invalid input" do
    let(:input) do
      {title: nil, body: nil, published_from: nil}
    end

    it "returns failure" do
      result = contract.(input)

      expect(result).to be_failure
      expect(result.errors[:title]).to eq ["must be a string"]
    end
  end
end
