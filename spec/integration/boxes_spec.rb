RSpec.describe "`boxybox boxes` command", type: :cli do
  it "executes `boxybox help boxes` command successfully" do
    output = `boxybox help boxes`
    expected_output = <<-OUT
Usage:
  boxybox boxes [INPUT]

Options:
  -h, [--help], [--no-help]  # Display usage information

Accepts a config as defined in the README and prints ASCII boxes in the terminal
    OUT

    expect(output).to eq(expected_output)
  end
end
