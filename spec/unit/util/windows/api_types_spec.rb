# encoding: UTF-8
#!/usr/bin/env ruby

require 'spec_helper'

describe "FFI::MemoryPointer", :if => Puppet.features.microsoft_windows? do
  context "read_wide_string" do
    let (:string) { "foo_bar" }

    it "should properly roundtrip a given string" do
      ptr = FFI::MemoryPointer.from_string_to_wide_string(string)
      read_string = ptr.read_wide_string(string.length)

      read_string.should == string
    end

    it "should return a given string in the default encoding" do
      ptr = FFI::MemoryPointer.from_string_to_wide_string(string)
      read_string = ptr.read_wide_string(string.length)

      read_string.encoding.should == Encoding.default_external
    end
  end
end
