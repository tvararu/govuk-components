shared_examples 'a component with a DSL wrapper' do
  describe 'wrapping the component', type: 'helper' do
    let(:component) { helper.send(helper_name, **kwargs, &block) }
    subject { Capybara::Node::Simple.new(component) }

    specify 'renders the component' do
      expect(subject).to have_css(component_css_class)
    end
  end

  describe 'wrapping slots' do
    subject { described_class.new(**kwargs, &block) }

    specify 'wraps all specified slots' do
      wrapped_slots.each do |wrapped_slot|
        is_expected.to respond_to(wrapped_slot)
      end
    end
  end
end
