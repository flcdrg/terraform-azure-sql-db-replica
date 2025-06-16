# terraform-azure-sql-db-replica

Example creating and importing Azure SQL Database with Geo Replica

## HCP Terraform configuration

1. Create Azure resource group

    ```bash
    az group create --name rg-georeplica-australiaeast --location australiaeast
    ```

2. Follow <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_oidc#creating-the-application-and-service-principal>

    Create a service principal that has contributor access to the resource group

    ```bash
    az ad sp create-for-rbac --name sp-terraform-azure-sql-db-replica --role Contributor --scopes /subscriptions/<yoursubscription>/resourceGroups/rg-georeplica-australiaeast
    ```

3. Then find app registration for this service principal in the portal and click on Manage | Authentication and **Add a platform**. Select Web and enter '<https://localhost>' for the redirect URI.
4. Then follow <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_oidc#granting-the-application-access-to-manage-resources-in-your-azure-subscription>
5. Add two federated credentials. One for 'plan' and one for 'apply'
