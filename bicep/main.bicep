param location string

//var suffix = uniqueString(resourceGroup().id)

module vnet 'modules/vnet/vnet.bicep' = {
  name: 'vnet'
  params: {
    location: location    
  }
}

