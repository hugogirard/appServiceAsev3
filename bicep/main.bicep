param location string
param vnetName string
param vnetCIDR string
param subnetASEName string
param subnetASECIDR string

var suffix = uniqueString(resourceGroup().id)

module vnet 'modules/vnet/vnet.bicep' = {
  name: 'vnet'
  params: {
    location: location    
    vnetName: vnetName
    VNET_CIDR: vnetCIDR
    subnetCidr: subnetASECIDR
    subnetName: subnetASEName
  }
}

module web 'modules/web/ase.bicep' = {
  name: 'web'
  params: {
    location: location
    suffix: suffix
    subnetId: vnet.outputs.subnetId
  }
}
