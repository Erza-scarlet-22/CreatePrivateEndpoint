# Set your Azure subscription
$subscriptionId = "c3bffe7f-e643-4393-ae69-ab6e9fd0668f"
Select-AzSubscription -SubscriptionId $subscriptionId

# Set the resource group and folder path
$resourceGroupName = "rg-ls-aratrika"
$templateFolderPath = "C:\Users\akundu00\Documents\psscrps\Endpoints"

# Get a list of all JSON files in the specified folder
$templateFiles = Get-ChildItem -Path $templateFolderPath -Filter *.json

# Loop through each template file and deploy the private endpoint
foreach ($templateFile in $templateFiles) {
    $templateFilePath = $templateFile.FullName

    # Deploy the private endpoint using the template
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFilePath
}

Write-Host "Deployment completed for all templates."
