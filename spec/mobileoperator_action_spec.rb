describe Fastlane::Actions::MobileoperatorAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The mobileoperator plugin is working!")

      Fastlane::Actions::MobileoperatorAction.run(nil)
    end
  end
end
