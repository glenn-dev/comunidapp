# README

# COMUNIDAPP

* El proyecto es un asistente para la administracion de condominios. Consiste en 3 tipos de usuario (SuperAdmin, Admin y Usuario). Cada uno de ellos tiene acceso a ciertos recursos especificados mas adelante.

* El sistema implementa una pasarela de pago mediante Paypal que permite a un usuario residente de un edificio pagar las boletas correspondientes a su departamento.

* La aplicacion contempla un almacenamiento de datos seguro en la nube (S3) mediante AWS.

* Todo el desarrollo esta enmarcado la aplicacion de conceptos y conocimientos adquiridos en la academia Desafio Latam (G-28)

* Ruby version: 2.6.0

* Rails version: 5.2.4.1

* Base de datos PostgreSQL.

* Se utilizo la herramienta Trello para la ejecucion del proyecto.
[Tablero Trello] (https://trello.com/b/RIZueiph/g-28)

* Para visualizar el landing page ingrese a:
* [Heroku] (https://afternoon-island-22684.herokuapp.com)
* Puede ingresar a la aplicacion utilizando las credenciales especificadas en los PASOS PARA DESPLEGAR LA APLICACION EN SERVIDOR LOCAL.

* Diagrama logico de la base de datos.
![alt text][logic]

[logic]: /diagrama_logico.png

# PASOS PARA DESPLEGAR LA APLICACION EN SERVIDOR LOCAL

# Pasos en consola:
* $ rvm use 2.6.0

* $ bundle i

* $ yarn

* $ rails db:create

* $ rails db:migrate

* $ rails db:seed

* $ rails s

# Pasos para acceder a la aplicacion:

* Ingresar en el navegador a: http://localhost:3000/

# Credenciales:
* La contraseña de todos los usuarios es: 123456

* SUPERADMIN: Puede efectuar CRUD a TODOS los recursos.
* EMAIL: glenn.marcano90@gmail.com

* ADMIN: Usuario administrador de un edificio, puede gestionar parcialmente los recursos: Comunicados, Boletas, Gastos generales y Conceptos.
* EMAIL: admin1@gmail.com (Reemplace el 1 por el numero de edificio a gestionar)

* RESIDENTE: Usuario residente de un edificio, puede gestionar parcialmente los recursos: Comunicados y Boletas.
* EMAIL: user01@gmail.com (Reemplace el 0 por el numero de edificio y 1 por el numero de departamento a gestionar.

* CONTACTO: glenn.marcano90@gmail.com
