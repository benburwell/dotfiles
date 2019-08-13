def gettag(name): .Tags[] | select(.Key == name).Value;

def getInstanceMetadata: .Reservations[].Instances[] |
	[
		.PrivateIpAddress,
		.PublicIpAddress // "--",
		gettag("Name") // "--",
		.InstanceId,
		.InstanceType
	] |
	join("\t");

