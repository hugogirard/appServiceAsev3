param location string

var vnetName = 'vnet-ase'
var VNET_CIDR = '10.0.0.0/16'
var subnetName = 'aseSubnet'
var subnetCidr = '10.0.1.0/24'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        VNET_CIDR
      ]
    }
  }
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2020-06-01' = {
  name: '${virtualNetwork.name}/${subnetName}'
  properties: {
    addressPrefix: subnetCidr
  }
}
