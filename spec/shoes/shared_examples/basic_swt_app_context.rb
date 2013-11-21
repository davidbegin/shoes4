# This is a shared context which mocks up the proper structure for the top
# level of an application. These should generally be used for specs against
# individual SWT element types to avoid having to hand-roll just part of the
# correct setup this represents.

shared_context "basic swt app" do
  let(:container) { double('container', is_disposed?: false) }
  let(:gui) { double('gui', real: container) }
  let(:app) { double('app',
                     real: container, gui: gui,
                     add_paint_listener: nil) }
end
