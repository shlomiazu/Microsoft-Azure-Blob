## Input Parameters  
$resourceGroupName="stg2505"  
$storageAccName="stg2505"
$storageAccName1="stg2605"  
$storageContainerName="microsoftcontainer"
$fileName="file1.txt"  
$filePath="C:\temptxt\file1.txt"

## Connect to Azure Account  
Connect-AzAccount   

## Function to upload blob contents

Function UploadBlobContent  
{  
    Write-Host -ForegroundColor Green "Uploading blob content.."  
    ## Get the storage account  
    $storageAcc=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName      
    ## Get the storage account context  
    $ctx=$storageAcc.Context    
    ## Upload a file 

    Get-ChildItem -Path C:\temptxt | foreach {Set-AzStorageBlobContent -Container $storageContainerName -File $_.FullName -Blob $_.BaseName -Context $ctx -Force
    }     
}   
  
UploadBlobContent   
 
## Disconnect from Azure Account  
Disconnect-AzAccount  

