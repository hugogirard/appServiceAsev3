param location string
param suffix string
param subnetId string

var aseName = 'ase-${suffix}'

resource ase 'Microsoft.Web/hostingEnvironments@2019-08-01' = {
  name: aseName
  kind: 'ASEV3'
  location: location
  properties: {
    zoneRedundant: false
    dedicatedHostCount: 0
    InternalLoadBalancingMode: 0
    virtualNetwork: {
      id: subnetId
    }
  }
}
