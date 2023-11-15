# Dist-sys

## Version 1.8 

![Arquitectura del proyecto final](./Architecture/Architecture%20dom-almacen.png)

|backend API's |Docker image|
|---|---|
|Firewall |api-firewall|
|Payments |kvin23/springboot-pay|
|Orders |kvin23/springboot-api|
|Deliveries |kvin23/springboot-dom|
|Catalogue |kvin23/nodejs-catalog|
|Users |kvin23/python-users|
|Databases |kvin23/postgres-project|
|Gateway |kong/kong-gateway|
|Message Broker |RabbitMQ|


## All the project was created and tested in terraform 3.0.1 or lastest

> [!IMPORTANT]
> Version 1.7 uses terraform 2.23.1, to update to Version 1.8 or newer you must run the command `terraform init -upgrade`and `terraform refresh`


***A rp for the Projects of Distributed Systems course in the UCC***
