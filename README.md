<div id="readme-top"></div>

<br>
<br>

<h2 align="center"> Crypto Market App </h2>
  <br>
<p align="center">
    A cryptocurrency price tracker
    <br>
    <br>
    <a href="https://github.com/CsongorD/Crypto-Market"><strong>Explore the docs :arrow_right:	</strong></a>
    <br />
</p>

<!-- TABLE OF CONTENTS -->
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
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
<div id="about-the-project"></div>

## About The Project :page_with_curl:

<br />
Crypto Market is a software for following the current cryptocurrency prices, buying and selling crypto.
<br />
<br />

<br />
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<div id="built-with"></div>

### Built With :wrench:

- [![Laravel][Laravel.img]][Laravel-url] [![PHP][PHP.img]][PHP-url]
- [![Flutter][Flutter.img]][Flutter-url] [![Dart][Dart.img]][Dart-url]
- [![MySQL][MySQL.img]][MySQL-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
<div id="getting-started"></div>

## Getting Started :arrow_forward:

<div id="prerequisites"></div>

### Prerequisites :ballot_box_with_check:

To run this project, you need to have the following:

:one: PHP <br>
:two: MySQL <br>
:three: Laravel <br>
:four: Flutter <br>

<div id="installation"></div>

## Installation :floppy_disk:

### Server side

#### Install dependencies

```bash
cd ./backend
composer install
```

#### .env file

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

&&

- https://coinmarketcap.com/ api key
  - CRYPTO_API = "YOUR CRYPTO API KEY"

3. Run the following code for generating a key to your app:
   ```bash
      php artisan key:generate
   ```

#### Prepare the database

Before all, you have to start your MySQL server to be able to fill up your database

```bash
cd ./backend
php artisan migrate
```

- This command will run create the tables in your database.

#### Running the code

```bash
cd ./server
php artisan serve
```

It will start the server on http://127.0.0.1:8000. It will watch the changes and restart the server if some ot the files
changed.

### Client side

#### Install dependencies

```bash
cd ./frontend
flutter pub get
```

#### Running the code

```bash
cd ./frontend
flutter run -d <device_id>
```

With this `flutter run -d <device_id>` you can choose on which device you want to run the application.
So with this command, you can run this app from any device like: Windows, macOS, Linux, Android,iOS and any browser.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
<div id="usage"></div>

## Usage :joystick:

On this website currently you can track live info about cryptocurrencies on the landing page,
on the left side of the header section you can click on the fingerprint icon and register or login.
After logging in, your profile page opens.
If you are logged in the header on the landing page,
the fingerprint icon changes to a profile icon where now you can view your profile.
On your profile page you can log out.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
<div id="contact"></div>

## Contact

:envelope: **Deák Csongor** - deak.csongor1@gmail.com &nbsp;&nbsp;&nbsp;&nbsp; :point_right:
&nbsp;&nbsp;&nbsp;&nbsp; [![Csongor's LinkedIn][linkedin-shield]][LinkedIn - Csongor]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

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
