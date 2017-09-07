def gettag(name): .Tags[] | select(.Key == name).Value;

def getInstanceMetadata: .Reservations[].Instances[] |
	[
		gettag("Name") // "--",
		.PrivateIpAddress,
		.PublicIpAddress // "--",
		.InstanceId,
		.InstanceType
	] |
	join("\t");

