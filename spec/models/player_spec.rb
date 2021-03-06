require 'spec_helper'

describe Player do
  describe "downcasing names" do
    subject { Player.create(name: "Gregg Van Hove") }
    its(:name) { should == "gregg van hove" }
  end

  it "should validate unique names" do
    Player.create(name: 'p1')
    p = Player.new(name: 'p1')
    p.should_not be_valid
    p.error_on(:name).should be_present
  end

  it "requires a name" do
    Player.new.should_not be_valid
  end

  describe '#to_s' do
    subject { Player.create(name: 'scooby doo') }
    its(:to_s) { should == 'Scooby Doo' }

    context "players with Irish names" do
      subject { player.to_s }

      let(:player) { Player.new name: "sam o'neill" }
      it { should == "Sam O'Neill" }
    end
  end
end
