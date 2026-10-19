```tf
data "azurerm_client_config" "current" {}

principal_id = data.azurerm_client_config.current.object_id
```

**Iska matlab hai ki jis identity se Terraform Azure mein authenticate hokar resources create kar raha hai, usi identity ko RBAC role assign hoga.**

Example:
1. Tum Satyam ke Azure account se login karte ho.
2. Terraform Key Vault create karta hai.
3. Terraform tumhare account ki Object ID retrieve karta hai.
4. Key Vault Secrets User role tumhare account ko assign ho jata hai.
Lekin dhyan do: Ye role secrets ko read karne ke liye hai, Key Vault ko manage karne ke liye nahi.

> Agar Terraform Azure DevOps pipeline ki Service Principal ya Managed Identity se authenticate karta hai, toh role us identity ko milega, tumhare personal account ko nahi.

---

Example:
1. Azure DevOps pipeline mein Azure Service Connection configured hai.
2. Terraform us Service Connection ke Service Principal ya Managed Identity se Azure authenticate karta hai.
3. data.azurerm_client_config.current.object_id us authenticated identity ki Object ID return karta hai.
4. azurerm_role_assignment usi identity ko Key Vault Secrets User role assign karta hai.

> Important: Service Connection ko RBAC role assign karne ke liye uske paas role assignments create karne ki required permission honi chahiye, jaise suitable scope par Owner ya Role Based Access Control Administrator.
