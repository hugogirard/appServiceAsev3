param location string
param vnetName string
param VNET_CIDR string
param subnetName string
param subnetCidr string

resource nsg 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: 'nsg-ase'
  location: location
}

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
    networkSecurityGroup: {
      id: nsg.id
    }
    delegations: [
      {
        name: 'ase-delegation'
        properties: {
          serviceName: 'Microsoft.Web/hostingEnvironments'
        }
      }
    ]
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'    
  }
}


output subnetId string = subnet.id
