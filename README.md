# Workshop

![Terraform](https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Terraform_Logo.svg/2560px-Terraform_Logo.svg.png)

## Table of Contents
- [Workshop](#workshop)
  - [Table of Contents](#table-of-contents)
    - [Azure](#azure)
      - [Login](#login)
      - [List Subscriptions](#list-subscriptions)
      - [Set Subscription](#set-subscription)
    - [Terraform](#terraform)
      - [Provisioning](#provisioning)
        - [Init](#init)
        - [Plan](#plan)
        - [Apply](#apply)
        - [Destroy](#destroy)
    - [Writing Code](#writing-code)
      - [Format](#format)
      - [Validate](#validate)
      - [Console](#console)
    - [Inspect](#inspect)
      - [Show](#show)
      - [State List](#state-list)
      - [State Show](#state-show)
      - [Output](#output)
      - [Graph](#graph)
    - [Logs](#logs)
      - [Enable](#enable)

### Azure

#### Login
```sh
az login
```

#### List Subscriptions
```sh
az account list --query "[].{AccountName:user.name, SubscriptionID:id, IsDefault:isDefault}" --output table
```

#### Set Subscription
```sh
az account set -s <subscription_id>
```

---

### Terraform

#### Provisioning

##### Init
Inicializar o diretório
```sh
terraform init
terraform init -backend-config "backend.config"
```

##### Plan
Verificar as mudanças
```sh
terraform plan
terraform plan -out my.plan
```

##### Apply
Aplicar as mudanças
```sh
terraform apply
terraform apply my.plan
```

##### Destroy
Destruir todos os recursos
```sh
terraform destroy
```

---

### Writing Code

#### Format
Formatar o código
```sh
terraform fmt
```

#### Validate
Validar a sintaxe do código
```sh
terraform validate
```

#### Console
Testar comandos de funções do Terraform
```sh
terraform console

split(",", "foo,bar,baz")
```

---

### Inspect

#### Show
Mostrar o estado atual
```sh
terraform show
```

#### State List
Listar os recursos do estado atual
```sh
terraform state list
```

#### State Show
Mostrar o estado atual de um recurso
```sh
terraform state show <resource>
```

#### Output
Mostrar as saídas do estado atual
```sh
terraform output
terraform output -json # Show Sensitive Data
```

#### Graph
Gerar um gráfico de recursos
```sh
terraform graph -type=plan | dot -Tpng >graph.png
```

---

### Logs

#### Enable

```sh
TF_LOG_CORE=DEBUG terraform plan
TF_LOG_PROVIDER=DEBUG terraform plan
```
