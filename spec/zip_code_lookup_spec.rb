require_relative '../lib/zip_code_lookup.rb'

describe ZipCodeLookup do
  it 'validates valid zip' do
    expect(ZipCodeLookup.valid?(30338)).to be true
  end

  it 'does not validate invalid' do
    expect(ZipCodeLookup.valid?(1)).to be false
  end
end
