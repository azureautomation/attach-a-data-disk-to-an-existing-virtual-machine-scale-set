$rgName = 'myResourceGroup'
$vmssName = 'myVMSS'

# Get scale set object
$vmss = Get-AzureRmVmss `
          -ResourceGroupName $rgName `
          -VMScaleSetName $vmssName

# Attach a 128 GB data disk to LUN 0
Add-AzureRmVmssDataDisk `
  -VirtualMachineScaleSet $vmss `
  -CreateOption Empty `
  -Lun 0 `
  -DiskSizeGB 128

# Update the scale set to apply the change
Update-AzureRmVmss `
  -ResourceGroupName $rgName `
  -Name $vmssName `
  -VirtualMachineScaleSet $vmss
