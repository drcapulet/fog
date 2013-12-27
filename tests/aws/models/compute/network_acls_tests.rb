Shindo.tests("Fog::Compute[:aws] | network_acls", ['aws']) do
  Fog::Compute::AWS::Mock.reset if Fog.mocking?
  @vpc = Fog::Compute[:aws].vpcs.create('cidr_block' => '10.0.10.0/24')

  collection_tests(Fog::Compute[:aws].network_acls, { :vpc_id => @vpc.id }, true)
  
  @vpc.destroy
  Fog::Compute::AWS::Mock.reset if Fog.mocking?
end
