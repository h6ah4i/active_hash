require 'spec/spec_helper'

describe ActiveYaml::Base do

  before do
    ActiveYaml::Base.set_root_path File.expand_path(File.dirname(__FILE__) + "/../fixtures")
  end

  describe ".all" do
    it "loads the data from the yml file" do
      class SomeArbitraryClass < ActiveYaml::Base
        set_filename "sample"
        field :name
      end

      records = SomeArbitraryClass.all
      records.length.should == 3
      records.should =~ [SomeArbitraryClass.new(:id => 1), SomeArbitraryClass.new(:id => 2), SomeArbitraryClass.new(:id => 3)]
      records.first.name.should == "US"
    end
  end

end
