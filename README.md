<div id="readme-top"></div>
<h1 align="center"> Crypto Market App  </h1>
  <br>
<h3 align="center">A cryptocurrency price tracker  </h3>
<br>
    <h4 align="center" href="https://github.com/CsongorD/Crypto-Market"><strong>Explore the docs :arrow_right:	</strong></h4>
    <br />

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#dockerization">Dockerization</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<div id="about-the-project"></div>
<h2>About The Project :page_with_curl:</h2>
<br />
Crypto Market is a multi-platform application for following the current cryptocurrency prices, buying and selling crypto.
<br />
<br />

<br />
<p align="right">(<a href="#readme-top">Back to top :arrow_up:</a>)</p>

<div id="built-with"></div>
<h2> Built With :wrench:</h2>

[![Laravel][Laravel.img]][Laravel-url] [![PHP][PHP.img]][PHP-url]
<br/>

[![Flutter][Flutter.img]][Flutter-url] [![Dart][Dart.img]][Dart-url]
<br>

[![MySQL][MySQL.img]][MySQL-url]

<p align="right">(<a href="#readme-top">Back to top :arrow_up:</a>)</p>

<div id="getting-started"></div>
<h2> Getting Started :arrow_forward:</h2>

<div id="prerequisites"></div>
<h3> Prerequisites :ballot_box_with_check:</h3>

To run this project, you need to have the following:

:one: PHP <br>
:two: MySQL <br>
:three: Laravel <br>
:four: Flutter <br>

OR

:five: Docker & Docker Compose <br>

<div id="installation"></div>
<h3> Installation :floppy_disk:</h3>

<h4> Server side</h4>

<h5> Install dependencies</h5>

```bash
cd ./backend
composer install
```

<h5> .env file</h5>

1. Copy the .env.sample as .env,

   - you can do that in the shell:
     ```bash
       cp .env.example .env
     ```
     or
   - manually copying the file

2. Fill up the environment variables with your:

- MySQL connection:

  - DB_DATABASE = "YOUR DATABASE NAME"
  - DB_USERNAME = "YOUR DATABASE USERNAME"
  - DB_PASSWORD = "YOUR DATABASE PASSWORD"

- https://coinmarketcap.com/ api key
  - CRYPTO_API = "YOUR CRYPTO API KEY"

3. Run the following code for generating a key to your app:
   ```bash
      php artisan key:generate
   ```

<h5> Prepare the database</h5>

Before all, you have to start your MySQL server to be able to fill up your database

```bash
cd ./backend
php artisan migrate
```

- This command will run create the tables in your database.

<h5> Running the code</h5>

```bash
cd ./server
php artisan serve
```

It will start the server on http://127.0.0.1:8000. It will watch the changes and restart the server if some ot the files
changed.

<h4> Client side</h4>

<h5> Install dependencies</h5>

```bash
cd ./frontend
flutter pub get
```

<h5> Running the code</h5>

```bash
cd ./frontend
flutter run -d <device_id>
```

With this `flutter run -d <device_id>` you can choose on which device you want to run the application.
So with this command, you can run this app from any device like: Windows, macOS, Linux, Android,iOS and any browser.

<div id="dockerization"></div>
<h3>Dockerization</h3>

1.Navigate to the project directory

```bash
cd ./Crypto-Market
```

2.Review the docker-compose.yml File

  - Set your env data:

    MYSQL_DATABASE="YOUR DATABASE NAME"<br>
    MYSQL_USER="YOUR DATABASE USERNAME"<br>
    MYSQL_PASSWORD="YOUR DATABASE PASSWORD"<br>
    MYSQL_ROOT_PASSWORD="YOUR ROOT PASSWORD"<br>


3.Build the Docker Containers

```bash
docker compose up --build
```

4.Access the Crypto Market on: `http://localhost:8080`

<p align="right">(<a href="#readme-top">Back to top :arrow_up:</a>)</p>

<div id="usage"></div>
<h2> Usage :joystick:</h2>

On this application currently you can track live info about cryptocurrencies on the landing page,
on the right side of the header section you can click on the fingerprint icon and register or login.
After logging in, your profile page opens.
If you are logged in the header on the landing page,
the fingerprint icon changes to a profile icon where now you can view your profile.
On your profile page you can log out and enable biometric lock if your device has a fingerprint scanner.

<p align="right">(<a href="#readme-top">Back to top :arrow_up:</a>)</p>

<div id="contact"></div>
<h2> Contact</h2>

:envelope: **Deák Csongor** - deak.csongor1@gmail.com &nbsp;&nbsp;&nbsp; :point_right:
&nbsp;&nbsp;&nbsp;
[![Csongor's LinkedIn][linkedin-shield]][LinkedIn - Csongor]

<p align="right">(<a href="#readme-top">Back to top :arrow_up:</a>)</p>

[linkedin-url]: https://linkedin.com/in/linkedin_username
[LinkedIn - Csongor]: https://www.linkedin.com/in/csongor-deak/
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[Laravel.img]: https://img.shields.io/badge/Laravel-white?style=for-the-badge&logo=Laravel
[Laravel-url]: https://laravel.com/
[Flutter.img]: https://img.shields.io/badge/Flutter-white?style=for-the-badge&logo=Flutter&logoColor=%2302569B
[Flutter-url]: https://flutter.dev/
[MySQL.img]: https://img.shields.io/badge/Mysql-white?style=for-the-badge&logo=Mysql&logoColor=%234479A1
[MySQL-url]: https://www.mysql.com/
[Dart.img]: https://img.shields.io/badge/Dart-white?style=for-the-badge&logo=Dart&logoColor=%230175C2
[Dart-url]: https://dart.dev/
[PHP.img]: https://img.shields.io/badge/PHP-white?style=for-the-badge&logo=PHP&logoColor=%23777BB4
[PHP-url]: https://www.php.net/
