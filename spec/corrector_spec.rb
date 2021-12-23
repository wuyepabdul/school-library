require_relative '../corrector'

describe Corrector do
  it 'should correctly correct a string' do 
    c = Corrector.new
    name = 'mathew davis'
    expect(c.correct_name name).to eql 'Mathew dav'
  end
end