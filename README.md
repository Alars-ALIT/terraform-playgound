If the ping command fails, check the following information:

Check that your NAT instance's security group rules allow inbound ICMP traffic from your private subnet. If not, your NAT instance cannot receive the ping command from your private instance.

Check that you've configured your route tables correctly. For more information, see Updating the Main Route Table.

Ensure that you've disabled source/destination checking for your NAT instance. For more information, see Disabling Source/Destination Checks.

Ensure that you are pinging a website that has ICMP enabled. If not, you will not receive reply packets. To test this, perform the same ping command from the command line terminal on your own computer.

ssh -t -i ssh/insecure-deployer "ubuntu@$(terraform output master.0.ip)"
ssh -t -i ssh/insecure-deployer "ubuntu@$(terraform output nat.ip)"