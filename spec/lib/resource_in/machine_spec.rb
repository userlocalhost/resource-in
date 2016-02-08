require 'spec_helper'

describe ResourceIn::Machine do
  # dummy data for testing logic of ResourceIn::Machine
  let(:ucs_data) {
    [
      {'name'=>'bl0000001', 'manager'=>'UCS', 'status'=>'ok', 'type'=>'Foo', 'location'=>'a1'},
      {'name'=>'bl0000200', 'manager'=>'UCS', 'status'=>'ok', 'type'=>'Bar', 'location'=>'b3'},
      {'name'=>'bl0000310', 'manager'=>'UCS', 'status'=>'warning', 'type'=>'Baz', 'location'=>'z9'},
    ]
  }
  let(:vmware_data) {
    [
      {'name'=>'vm0000001', 'manager'=>'VMware', 'address'=>'10.0.0.1', 'status'=>'ok', 'type'=>'Foo', 'location'=>'a1'},
      {'name'=>'vm0000200', 'manager'=>'VMware', 'address'=>'10.0.1.2', 'status'=>'ok', 'type'=>'Bar', 'location'=>'b3'},
      {'name'=>'vm0000310', 'manager'=>'VMware', 'address'=>'10.0.2.3', 'status'=>'warning', 'type'=>'Baz', 'location'=>'z9'},
    ]
  }

  before do
    allow_any_instance_of(ResourceIn::UCSDriver).to receive(:get_data).and_return(ucs_data)
    allow_any_instance_of(ResourceIn::VMwareDriver).to receive(:get_data).and_return(vmware_data)
  end
  context "testing for basic feature" do
    it "could get data from drivers" do
      machine = ResourceIn::Machine.new
      data = machine.get_data
      expect(data.length).to eq (ucs_data.length + vmware_data.length)
    end
    it "could filter with specified condition" do
      machine = ResourceIn::Machine.new
      data = machine.get_data
      machine.filter(data, 'vm00002').each do |obj|
        expect(obj['address']).to eq '10.0.1.2'
      end
    end
    it "could get result supposed output" do
      machine = ResourceIn::Machine.new
      expect{ machine.show('10.0.1.*') }.not_to output(/10.0.0.1/).to_stdout
    end
  end
end
