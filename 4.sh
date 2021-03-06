{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "sites_0537d0537db16_name": {
            "defaultValue": "[resourceGroup().name]",
            "type": "String"
        },
        
		"location": {
		"type": "string",
		"defaultValue": "[resourceGroup().location]",
		"type": "String"
		},
		"docker": {
		"type": "string"
		
		}
		
    },
    "variables": {},
    "resources": [
        {
            "type": "Microsoft.Web/sites",
            "apiVersion": "2021-03-01",
            "name": "[parameters('sites_0537d0537db16_name')]",
            "location": "[parameters('location')]",
            "kind": "app,linux,container",
            "properties": {
                "enabled": true,
                "hostNameSslStates": [
                    {
                        "name": "[concat(parameters('sites_0537d0537db16_name'), '.', parameters('sites_0537d0537db16_name'), '.appserviceenvironment.net')]",
                        "sslState": "Disabled",
                        "hostType": "Standard"
                    },
                    {
                        "name": "[concat(parameters('sites_0537d0537db16_name'), '.scm.', parameters('sites_0537d0537db16_name'), '.appserviceenvironment.net')]",
                        "sslState": "Disabled",
                        "hostType": "Repository"
                    }
                ],
                
                "reserved": true,
                "isXenon": false,
                "hyperV": false,
                "siteConfig": {
                    "numberOfWorkers": 1,
                    "linuxFxVersion": "[parameters('docker')]", 
                    "acrUseManagedIdentityCreds": false,
                    "alwaysOn": true,
                    "http20Enabled": true,
                    "functionAppScaleLimit": 0,
                    "minimumElasticInstanceCount": 0
                },
                "scmSiteAlsoStopped": false,
               
                "clientAffinityEnabled": true,
                "clientCertEnabled": false,
                "clientCertMode": "Required",
                "hostNamesDisabled": false,
                "customDomainVerificationId": "73600D12B0EB4177B6409208D668CB05EB897BB212F727BC91284C5A8FC79FB4",
                "containerSize": 0,
                "dailyMemoryTimeQuota": 0,
                "httpsOnly": false,
                "redundancyMode": "None",
                "storageAccountRequired": false,
                "keyVaultReferenceIdentity": "SystemAssigned"
            }
        },
        {
            "type": "Microsoft.Web/sites/basicPublishingCredentialsPolicies",
            "apiVersion": "2021-03-01",
            "name": "[concat(parameters('sites_0537d0537db16_name'), '/ftp')]",
            "location": "[parameters('location')]",
            "dependsOn": [
                "[resourceId('Microsoft.Web/sites', parameters('sites_0537d0537db16_name'))]"
            ],
            "properties": {
                "allow": true
            }
        },
        {
            "type": "Microsoft.Web/sites/basicPublishingCredentialsPolicies",
            "apiVersion": "2021-03-01",
            "name": "[concat(parameters('sites_0537d0537db16_name'), '/scm')]",
            "location": "[parameters('location')]",
            "dependsOn": [
                "[resourceId('Microsoft.Web/sites', parameters('sites_0537d0537db16_name'))]"
            ],
            "properties": {
                "allow": true
            }
        },
        {
            "type": "Microsoft.Web/sites/config",
            "apiVersion": "2021-03-01",
            "name": "[concat(parameters('sites_0537d0537db16_name'), '/web')]",
            "location": "[parameters('location')]",
            "dependsOn": [
                "[resourceId('Microsoft.Web/sites', parameters('sites_0537d0537db16_name'))]"
            ],
            "properties": {
                "numberOfWorkers": 1,
                "defaultDocuments": [
                    "Default.htm",
                    "Default.html",
                    "Default.asp",
                    "index.htm",
                    "index.html",
                    "iisstart.htm",
                    "default.aspx",
                    "index.php",
                    "hostingstart.html"
                ],
                "netFrameworkVersion": "v4.0",
                "linuxFxVersion": "[parameters('docker')]",
                "requestTracingEnabled": false,
                "remoteDebuggingEnabled": false,
                "remoteDebuggingVersion": "VS2019",
                "httpLoggingEnabled": false,
                "acrUseManagedIdentityCreds": false,
                "logsDirectorySizeLimit": 35,
                "detailedErrorLoggingEnabled": false,
                "publishingUsername": "$0537d0537db16",
                "scmType": "None",
                "use32BitWorkerProcess": true,
                "webSocketsEnabled": false,
                "alwaysOn": true,
                "managedPipelineMode": "Integrated",
                "virtualApplications": [
                    {
                        "virtualPath": "/",
                        "physicalPath": "site\\wwwroot",
                        "preloadEnabled": true
                    }
                ],
                "loadBalancing": "LeastRequests",
                "experiments": {
                    "rampUpRules": []
                },
                "autoHealEnabled": false,
                "vnetRouteAllEnabled": false,
                "vnetPrivatePortsCount": 0,
                "localMySqlEnabled": false,
                "ipSecurityRestrictions": [
                    {
                        "ipAddress": "Any",
                        "action": "Allow",
                        "priority": 1,
                        "name": "Allow all",
                        "description": "Allow all access"
                    }
                ],
                "scmIpSecurityRestrictions": [
                    {
                        "ipAddress": "Any",
                        "action": "Allow",
                        "priority": 1,
                        "name": "Allow all",
                        "description": "Allow all access"
                    }
                ],
                "scmIpSecurityRestrictionsUseMain": false,
                "http20Enabled": true,
                "minTlsVersion": "1.2",
                "scmMinTlsVersion": "1.0",
                "ftpsState": "AllAllowed",
                "preWarmedInstanceCount": 0,
                "functionAppScaleLimit": 0,
                "functionsRuntimeScaleMonitoringEnabled": false,
                "minimumElasticInstanceCount": 0,
                "azureStorageAccounts": {}
            }
        },
        {
            "type": "Microsoft.Web/sites/hostNameBindings",
            "apiVersion": "2021-03-01",
            "name": "[concat(parameters('sites_0537d0537db16_name'), '/', parameters('sites_0537d0537db16_name'), '.', parameters('sites_0537d0537db16_name'), '.appserviceenvironment.net')]",
            "location": "[parameters('location')]",
            "dependsOn": [
                "[resourceId('Microsoft.Web/sites', parameters('sites_0537d0537db16_name'))]"
            ],
            "properties": {
                "siteName": "0537d0537db16",
                "hostNameType": "Verified"
            }
        },
        
        {
            "type": "Microsoft.Web/sites/snapshots",
            "apiVersion": "2015-08-01",
            "name": "[concat(parameters('sites_0537d0537db16_name'), '/2022-03-09T05_07_22_7021039')]",
            "dependsOn": [
                "[resourceId('Microsoft.Web/sites', parameters('sites_0537d0537db16_name'))]"
            ]
        }
    ]
}
