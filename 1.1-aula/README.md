# Aula 1

```sh
terraform init
```

```sh
terraform validate
```

```sh
terraform plan -out myplan
```

```sh
terraform show -json myplan > myplan.json
```

```sh
terraform apply myplan
```

---

```sh
terraform init -backend-config=backend.config -reconfigure
```

```sh
terraform console
```

```tf
toset(["a", "b", "c", "c"])
contains(toset(["a", "b", "c", "c"]), "d")
```