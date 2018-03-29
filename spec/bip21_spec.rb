RSpec.describe Bip21 do
  it "has a version number" do
    expect(Bip21::VERSION).not_to be nil
  end

  it "encode address" do
    expect(Bip21::Bip21.encode("bitcoin","1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2")).to eq("bitcoin:1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2")
  end

  it "encode amount" do
    expect(Bip21::Bip21.encode("bitcoin","1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2", {amount: "0.5"})).to eq("bitcoin:1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2?amount=0.5")
  end

  it "test invalid amount exception" do
    expect {
      Bip21::Bip21.encode("bitcoin","1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2", {amount: "invalid amount"})
    }.to raise_error(Bip21::InvalidAmountError)
  end

  it "encode amount + address + label" do
    expect(Bip21::Bip21.encode("bitcoin","1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2", {amount: "0.5", label: 'bip21'})).to eq("bitcoin:1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2?amount=0.5&label=bip21")
  end

  it "encode amount contains no comma" do
    expect {
      Bip21::Bip21.encode("bitcoin","1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2", {amount: "0,5"})
    }.to raise_error(Bip21::InvalidAmountError)
  end

  it "encode ltc as currency" do
    expect(
      Bip21::Bip21.encode("litecoin","3MidrAnQ9w1YK6pBqMv7cw5bGLDvPRznph", {amount: "0.5"})
    ).to eq('litecoin:3MidrAnQ9w1YK6pBqMv7cw5bGLDvPRznph?amount=0.5')
  end



end
