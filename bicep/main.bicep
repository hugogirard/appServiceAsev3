param location string

var suffix = uniqueString(resourceGroup().id)

module vnet 'modules/vnet/vnet.bicep' = {
  name: 'vnet'
  params: {
    location: location    
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
