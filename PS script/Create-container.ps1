## Input Parameters  
$resourceGroupName="stg2505"  
$storageAccName="stg2505" 
$storageContainerName="microsoftcontainer"

## Connect to Azure Account  
Connect-AzAccount   
 
## Function to create the storage container  
Function CreateStorageContainer  
{  
    Write-Host -ForegroundColor Green "Creating storage container.."  
    ## Get the storage account in which container has to be created  
    $storageAcc=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName      
    ## Get the storage account context  
    $ctx=$storageAcc.Context      
 
    ## Check if the storage container exists  
    if(Get-AzStorageContainer -Name $storageContainerName -Context $ctx -ErrorAction SilentlyContinue)  
    {  
        Write-Host -ForegroundColor Magenta $storageContainerName "- container already exists."  
    }  
    else  
    {  
       Write-Host -ForegroundColor Magenta $storageContainerName "- container does not exist."   
       ## Create a new Azure Storage Account  
       New-AzStorageContainer -Name $storageContainerName -Context $ctx -Permission Container  
    } 

    Write-Host -ForegroundColor Green "container created.."
       
}  

CreateStorageContainer 

## Disconnect from Azure Account  
Disconnect-AzAccount  
