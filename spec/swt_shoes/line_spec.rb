require 'swt_shoes/spec_helper'

describe Shoes::Swt::Line do
  let(:app) { double('app', :add_paint_listener => true) }
  let(:dsl) { double('dsl').as_null_object }
  let(:point_a) { Shoes::Point.new(10, 100) }
  let(:point_b) { Shoes::Point.new(300, 10) }

  subject {
    Shoes::Swt::Line.new(dsl, app, point_a, point_b)
  }

  context "#initialize" do
    it { should be_instance_of(Shoes::Swt::Line) }
    its(:dsl) { should be(dsl) }

    specify "adds paint listener" do
      app.should_receive(:add_paint_listener)
      subject
    end
  end

  it_behaves_like "paintable"

  describe "painter" do
    include_context "painter context"

    let(:shape) { Shoes::Swt::Line.new(dsl, app, point_a, point_b) }
    subject { Shoes::Swt::Line::Painter.new(shape) }

    it_behaves_like "stroke painter"

    specify "draws line" do
      gc.should_receive(:draw_line).with(10, 100, 300, 10)
      subject.paint_control(event)
    end
  end
end
