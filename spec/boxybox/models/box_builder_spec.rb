require 'rspec'
require 'tty-box'
require 'boxybox/models/box_builder'

describe BoxBuilder do
  describe '#merge_boxes' do
    subject { BoxBuilder.merge_boxes(*input) }

    context 'two boxes' do
      let(:first_box) { TTY::Box.frame(width: 10, height: 10, padding: 1) }
      let(:second_box) { TTY::Box.frame(width: 10, height: 10, padding: 1) }
      let(:input) { [first_box, second_box] }
      let(:output) do
        "┌────────┐┌────────┐\n│        ││        │\n│        ││        │\n│        ││        │\n│        ││        │"\
        "\n│        ││        │\n│        ││        │\n│        ││        │\n│        ││        │\n└────────┘└────────┘"
      end

      context 'when boxes are same height' do
        it 'should return concatinated boxes' do
          expect(subject).to eq output
        end
      end

      context 'when boxes are varying height' do
        let(:first_box) { TTY::Box.frame(width: 10, height: 5, padding: 1) }
        let(:output) do
          "┌────────┐┌────────┐\n│        ││        │\n│        ││        │\n│        ││        │\n" \
          "└────────┘│        │\n          │        │\n          │        │\n          │        │\n" \
          "          │        │\n          └────────┘"
        end

        it 'should return concatinated boxes' do
          expect(subject).to eq output
        end

        context 'when boxes are reversed' do
          let(:output) do
            "┌────────┐┌────────┐\n│        ││        │\n│        ││        │\n│        ││        │\n" \
            "│        │└────────┘\n│        │          \n│        │          \n│        │          \n" \
            "│        │          \n└────────┘          "
          end
          let(:input) { [second_box, first_box] }

          it 'should return concatinated boxes' do
            expect(subject).to eq output
          end
        end
      end
    end
  end
end
