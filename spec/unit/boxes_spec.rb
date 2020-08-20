require 'boxybox/commands/boxes'

RSpec.describe Boxybox::Commands::Boxes do
  it "executes `boxes` command successfully" do
    output = StringIO.new
    input = nil
    options = {}
    command = Boxybox::Commands::Boxes.new(input, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
