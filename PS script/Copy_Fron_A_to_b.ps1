
## Input Parameters  
$resourceGroupName="stg2505"  
$storageAccName="stg2505"
$storageAccName1="stg2605"
$containerName="microsoftcontainer"

## Connect to Azure Account  
Connect-AzAccount   
 
## Function to create the storage container  
## Function to get all the blobs  
Function GetAllBlobs  
{  
    Write-Host -ForegroundColor Green "Retrieving all blobs from storage container.."    
    ## Get the storage account   
    $storageAcc=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName     
    ## Get the storage account context  
    $ctx=$storageAcc.Context  
    ## Get all the containers  
    $containers=Get-AzStorageContainer  -Context $ctx         
    ## Get all the blobs  
    $blobs=Get-AzStorageBlob -Container $containerName  -Context $ctx  
    
    ## Get the storage account of distations
    $storageAcc1=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName1     
    ## Get the storage account context  
    $ctx1=$storageAcc1.Context  
    ## Get all the containers  
    
            
    ## Copy the bolb to des.. Container  
     Get-AzStorageBlob -Container $containerName -Context $ctx -Blob "*.*" | Start-AzStorageBlobCopy -DestContainer $storageContainerName -Context $ctx1 -Force
      
      
}  
  
GetAllBlobs   
## Disconnect from Azure Account  
Disconnect-AzAccount  
 