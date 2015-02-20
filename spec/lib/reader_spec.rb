require 'spec_helper'

describe Qif::Reader do
  it 'should reject the wrong file and raise an UnrecognizedData exception' do
    expect{ Qif::Reader.new(open('spec/fixtures/not_a_QIF_file.txt')) }.to raise_error(Qif::Reader::UnrecognizedData)
  end
end
