-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-07-2024 a las 00:33:00
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_rest_full_php_nativo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `email` text NOT NULL,
  `id_cliente` text NOT NULL,
  `llave_secreta` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `email`, `id_cliente`, `llave_secreta`, `created_at`, `updated_at`) VALUES
(1, 'Luis', 'Bueno', 'luis.bueno@correo.com', 'c2ac07cafartwetsdAD52356FEDGe4KSShlie7V7Zde55VHfHMymSMhX5i8.', 'a2aa07aafartwetsdAD52356FEDGe6fVJ4GEnRZlqUB.ZsTADDqAqlK7bVmm', '2024-04-20 08:24:30', '2024-04-20 08:24:30'),
(2, 'Alex', 'Almendro', 'alex.almendro@correo.com', 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', 'a2aa07aafartwetsdAD52356FEDGejLzuQcRg56RoE23ab1gvVhiBE9D2bjC', '2024-04-20 08:23:14', '2024-04-20 08:23:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `titulo` text NOT NULL,
  `descripcion` text NOT NULL,
  `instructor` text NOT NULL,
  `imagen` text NOT NULL,
  `precio` float NOT NULL,
  `id_creador` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `titulo`, `descripcion`, `instructor`, `imagen`, `precio`, `id_creador`, `created_at`, `updated_at`) VALUES
(1, 'Angular: De cero a experto creando aplicaciones (Angular 8+)', 'Todo lo que necesitas saber de angular utilizando TypeScript y buenas prácticas ofrecidas por el equipo de angular.', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1075334_8b5f_4.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(2, 'Desarrollo Web Completo con HTML5, CSS3, JS AJAX PHP y MySQL', 'Aprende Desarrollo Web con este curso 100% práctico, paso a paso y sin conocimientos previos, INCLUYE PROYECTO FINAL', 'Juan Pablo De la torre Valdez', 'https://i.udemycdn.com/course/480x270/980450_7fc0_3.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(3, 'Programación de Android desde Cero +35 horas Curso COMPLETO', 'Aprender a programar aplicaciones y juegos para Android de forma profesional y desde cero.', 'Jose Javier Villena', 'https://i.udemycdn.com/course/480x270/957106_270f_6.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(4, 'Universidad Java: De Cero a Master +82 hrs (JDK 13 update)!', 'El mejor curso para aprender Java, POO, JDBC, Servlets, JSPs, Java EE, Web Services, JSF, EJB, JPA, PrimeFaces y JAX-RS!', 'Global Mentoring', 'https://i.udemycdn.com/course/480x270/1265942_7e2f_9.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(5, 'Curso Maestro de Python 3: Aprende Desde Cero', 'Aprende a programar con clases y objetos, a usar ficheros y bases de datos SQLite, interfaces gráficas y más con Python', 'Héctor Costa Guzmán', 'https://i.udemycdn.com/course/480x270/882422_0549_9.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(6, 'Master en JavaScript: Aprender JS, jQuery, Angular 8, NodeJS', 'Master en JavaScript: Aprender JS, jQuery, Angular 8, NodeJS', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/1337000_0d99.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(7, 'Master en Programación de Videojuegos con Unity® 2019 y C#', 'Aprende a programar videojuegos desde cero a nivel AVANZADO y profesional con Unity® 2019', 'Mariano Rivas', 'https://i.udemycdn.com/course/480x270/371090_f92b_6.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(8, 'Diseño Web Desde Cero a Avanzado 45h Curso COMPLETO', 'Aprende a Diseñar Páginas Web Responsive Design, atractivas, de forma profesional y sin dificultad con HTML5 y CSS3', 'Jose Javier Villena', 'https://i.udemycdn.com/course/480x270/809410_4666_6.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(9, 'Diseño Web Profesional El Curso Completo, Práctico y desde 0', 'HTML5, CSS3, Responsive Design, Adobe XD, SASS, JavaScript, jQuery, Bootstrap 4, WordPress, Git, GitHub', 'Carlos Arturo Esparza', 'https://i.udemycdn.com/course/480x270/782428_b5cf_4.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(10, 'PHP 7 y MYSQL: El Curso Completo, Práctico y Desde Cero !', 'HTML5, CSS3, Responsive Design, Adobe XD, SASS, JavaScript, jQuery, Bootstrap 4, WordPress, Git, GitHub', 'Carlos Arturo Esparza', 'https://i.udemycdn.com/course/480x270/672600_1def_7.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(11, 'Curso de C++: Básico a Avanzado', 'Curso diseñado para principiantes o estudiantes universitarios sin conocimientos previos del lenguaje', 'Gianmarco Tantaruna', 'https://i.udemycdn.com/course/480x270/763172_d61c_4.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(12, 'Node: De cero a experto', 'Curso diseñado para principiantes o estudiantes universitarios sin conocimientos previos del lenguaje', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1562070_d426.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(13, 'Master en PHP, SQL, POO, MVC, Laravel, Symfony, WordPress +', 'Aprende PHP desde cero, bases de datos, SQL, MySQL, POO, MVC, Librerías, Laravel 5 y 6, Symfony 4 y 5, WordPress +56h', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/1438222_0ec3_4.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(14, 'Aprende Programación en C desde cero', 'Metodología, Algoritmos, Estructura de Datos y Organización de Archivos', 'Alejandro Miguel Taboada Sanchez', 'https://i.udemycdn.com/course/480x270/728634_9428_7.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(15, 'ionic 2 y ionic 3: Crea apps para Android e iOS desde cero.', 'Creemos apps para nuestros dispositivos móviles con el conocimiento que tenemos de Angular, HTML, CSS y JavaScript', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1145678_760a_6.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(16, 'JavaScript: de cero hasta los detalles', 'En este poderoso lenguaje de programación web cada día más utilizado', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/751768_27d8.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(17, 'Curso de Angular 8 - Desde cero hasta profesional', 'Aprende a desarrollar aplicaciones web modernas de forma práctica y desde cero con Angular 4, 5, 6, 7 y 8 (Angular 2+)', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/1156926_b2c4_6.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(18, 'Curso completo de Machine Learning: Data Science en Python', 'Aprende los algoritmos de Machine Learning con Python para convertirte en un Data Science con todo el código para usar', 'Juan Gabriel Gomila Salas', 'https://i.udemycdn.com/course/480x270/1606018_069c.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(19, 'Flutter: Tu guía completa de desarrollo para IOS y Android', 'Push, Cámara, Mapas, REST API, SQLite, CRUD, Tokens, Storage, Preferencias de usuario, PlayStore, AppStore, Bloc y más!', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/2306140_8181.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(20, 'Angular Avanzado: Lleva tus bases al siguiente nivel - MEAN', 'MEAN, Google Signin, JWT, carga de archivos, lazyload, optimizaciones, Git, GitHub, panel administrativo y mucho más.', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1420028_b32f.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(21, 'React JS + Redux + ES6. Completo ¡De 0 a experto! (español)', 'El curso de React en español más elegido. Desarrollo en forma práctica, ejemplos, fundamentos y herramientas útiles', 'Ing. Emiliano Ocariz', 'https://i.udemycdn.com/course/480x270/1374394_f1a8_2.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(22, 'Spring Framework 5: Creando webapp de cero a experto (2019)', 'Construye aplicaciones web reales con Spring Framework 5 & Spring Boot: Thymeleaf, JPA, Security, REST, Angular, WebFlux', 'Andrés José Guzmán', 'https://i.udemycdn.com/course/480x270/1388250_e9ac_6.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(23, 'GIT+GitHub: Todo un sistema de control de versiones de cero', 'No vuelvas a perder tu trabajo por cualquier tipo de problema, aprende a trabajar de una forma segura y en equipo', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1235212_3204_2.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(24, 'Curso de TypeScript - El lenguaje utilizado por Angular 2', 'Aprende JavaScript orientado a objetos con TypeScript el lenguaje usado en Angular 2 (nuevo y mejorado AngularJS)', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/914024_9850.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(25, 'Crea sistemas POS Inventarios y ventas con PHP 7 y AdminLTE', 'Aprende JavaScript orientado a objetos con TypeScript el lenguaje usado en Angular 2 (nuevo y mejorado AngularJS)', 'Juan Fernando Urrego', 'https://i.udemycdn.com/course/480x270/1467412_94b5_11.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(26, 'Curso de Desarrollo Web Completo 2.0', '¡Aprende haciendo! HTML5, CSS3, Javascript, jQuery, Bootstrap 4, WordPress, PHP, MySQL, APIs, apps móviles y Python', 'Jose Luis Núñez Montes', 'https://i.udemycdn.com/course/480x270/834866_4564_2.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(27, 'Aprende Programación C# con Visual Studio desde cero.', 'Aprende una sólida base de programación con Visual Studio, C# y el Framework .NET', 'Mariano Rivas', 'https://i.udemycdn.com/course/480x270/797188_b203_5.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(28, 'Bootstrap 4: El Curso Completo, Práctico y Desde Cero', 'Aprende a crear cualquier sitio web adaptable a dispositivos móviles con Boostrap 4, el mejor framework de diseño web', 'Carlos Arturo Esparza', 'https://i.udemycdn.com/course/480x270/1245130_efdb_5.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(29, 'Desarrollo Web con Spring Boot - De Cero a Ninja', 'El curso definitivo de Spring Framework 4.3 desde cero: Spring Boot + Rest + MVC + Security + Data JPA + Thymeleaf', 'Miguel A. M.', 'https://i.udemycdn.com/course/480x270/984636_5a01_8.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(30, 'iOS y Swift : Curso Completo de Cero a Profesional', 'Aprende a Desarrollar Apps Móviles para iPhone y iPad en Swift Desde Cero con el Mejor Curso de iOS y Swift en Español.', 'Juan Villalvazo', 'https://i.udemycdn.com/course/480x270/1242552_1235_4.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(31, 'Crea sistemas Ecommerce con PHP 7 con pagos de PAYPAL y PAYU', 'Aprende a crear tu propio ecosistema de comercio electrónico con PHP 7 usando AdminLTE y recibe pagos con PAYPAL y PAYU', 'Juan Fernando Urrego', 'https://i.udemycdn.com/course/480x270/1322574_f1bd_10.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(32, 'Fundamentos de Programación', 'Aprende las Bases de la Programación en 9 lenguajes a la vez: Java, Python, Go, C++, PHP, Ruby, C#, JavaScript y C', 'Jose Javier Villena', 'https://i.udemycdn.com/course/480x270/1192848_e63a.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(33, 'ionic 5: Crear aplicaciones IOS, Android y PWAs con Angular', 'Google Play Store, Apple App Store, PWAs, Push Notifications, despliegues en la web, tabletas y mucho más', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/2088520_5480.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(34, 'Curso Completo de iOS 10 y Swift 3: de Cero a Experto con JB', 'El Curso más actualizado de iOS 10 y Swift 3 en español. Desarrollo completo de apps móviles para iPhone y iPad en Swift', 'Juan Gabriel Gomila Salas', 'https://i.udemycdn.com/course/480x270/883176_ad3a_4.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(35, 'Desarrollo de sistemas web en PHP 7 POO, MySQL, Jquery Ajax', 'Diseña sistemas web en PHP Orientado Objetos, MariaDB (MySql), Jquery Ajax, HTML5 CSS3 Bootstrap INCLUYE PROYECTO FINAL', 'Juan Carlos Arcila Díaz', 'https://i.udemycdn.com/course/480x270/1149390_0753_5.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(36, 'Desarrollo web con JavaScript, Angular, NodeJS y MongoDB', 'Aprende a desarrollar una webapp como Spotify usando el MEAN Stack (Node, MongoDB, Express, JWT y Angular 4, 5, 6, 7, 8)', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/1023976_d8a0_9.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(37, 'Dominando Laravel - De principiante a experto', 'Aprende a crear aplicaciones robustas y escalables con el framework más popular de PHP, Laravel', 'Jorge García', 'https://i.udemycdn.com/course/480x270/1126742_f0d3_3.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(38, 'Aprender a programar con Java. De cero hasta hacer sistemas', '¡Ahora con JavaFX! Aprende conceptos básicos de programación hasta el desarrollo de un sistema completo con Java.', 'Javier Arturo Vázquez Olivares', 'https://i.udemycdn.com/course/480x270/908106_359a_2.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(39, 'Java y BlueJ | Introducción a las Bases de la Programación', 'Curso Básico introductorio del lenguaje Java para personas que no saben programar aún.', 'Javier Arturo Vázquez Olivares', 'https://i.udemycdn.com/course/480x270/948840_f991.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(40, 'Crea tu Tienda Online Sin Inventario y Aprende Dropshipping', 'Aprende Dropshipping, Crea tu Tienda Online, Lanzate al mercado y obtén tus primeras ventas sin Comprar inventario!', 'Rodrigo Martinez Blanco', 'https://i.udemycdn.com/course/480x270/546338_4f43_3.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(41, 'Aprende Programación en C++ (Básico - Intermedio - Avanzado)', 'Si eres un apasionado de la programación, este curso te interesa. aprenderás desde las bases hasta lo avanzado en C++', 'Alejandro Miguel Taboada Sanchez', 'https://i.udemycdn.com/course/480x270/484388_ab1c_2.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(42, 'Curso Completo de Desarrollo ASP.NET MVC', 'Crea aplicaciones web fácilmente con .Net Framework', 'Ángel Arias', 'https://i.udemycdn.com/course/480x270/1209326_ca41_6.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(43, 'Git y GitHub Completo Desde Cero', 'Aprende Git y GitHub de forma completa y desde cero. Con ejemplos prácticos. Sé un profesional del control de versiones.', 'Jose Javier Villena', 'https://i.udemycdn.com/course/480x270/940740_4db9_4.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(44, 'Curso Completo Python 3 - Desde las Bases hasta Django', 'Django,Flask,Bases del lenguaje, Programación Orientada a Objetos, Lectura y Escritura de Archivos y Bases de Datos', 'Aldo Olivares', 'https://i.udemycdn.com/course/480x270/1114896_e264_3.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(45, 'React - La Guía Completa - Hooks Redux Context +15 Proyectos', 'Incluye React Hooks, Cloud Firestore, Redux, React Router, NextJS, Axios, REST API\'s, Seguridad, Autenticación y CRUDS!', 'Juan Pablo De la torre Valdez', 'https://i.udemycdn.com/course/480x270/1756340_0543_4.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(46, 'Curso completo de Machine Learning: Data Science con Rstudio', 'Aprende a analizar datos estadísticos con los trucos de Juan Gabriel Gomila, prof. de Universidad de las Islas Baleares', 'Juan Gabriel Gomila Salas', 'https://i.udemycdn.com/course/480x270/1483710_7395_2.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(47, 'Desarrollo Profesional de Temas y Plugins de WordPress', 'Aprende a crear Temas, Plugins y Bloques de Gutenberg con este curso práctico CREA SITIOS 100% DINAMICOS en WordPress', 'Juan Pablo De la torre Valdez', 'https://i.udemycdn.com/course/480x270/378726_c37d_5.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(48, 'Máster en PHP 7+, POO, MVC, MySQL, Laravel 6+, CodeIgniter 4', '¡Aprende PHP y MySQL desde cero y crea tu propio CMS y API REST, usando los Framework de Laravel 6+ y CodeIgniter 4!', 'Juan Fernando Urrego', 'https://i.udemycdn.com/course/480x270/970528_f38a_3.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(49, 'Desarrollo de Aplicaciones móviles Android con App Inventor', '¡Crea increíbles aplicaciones móviles para Android sin programar utilizando App Inventor! 33 apps paso a paso', 'Jose Luis Núñez Montes', 'https://i.udemycdn.com/course/480x270/486808_1e8f_2.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(50, 'SQL. Curso completo de SQL. Aprende desde cero.', 'Aprende SQL desde cero para saber manejar cualquier base de datos', 'Redait Media', 'https://i.udemycdn.com/course/480x270/2137076_bbdf_4.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(51, 'AngularJS - Desde Hola Mundo hasta una Aplicación', 'Aprende como crear aplicaciones web con esta increíble herramienta de desarrollo potenciada por Google, AngularJS.', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/467470_b749_3.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(52, 'Aprende Programación en Java (de Básico a Avanzado)', 'En este curso Aprenderás a programar en el lenguaje de programación Java, con un curso 30% teórico, 70% practico.', 'Alejandro Miguel Taboada Sanchez', 'https://i.udemycdn.com/course/480x270/802946_e81d.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(53, 'Curso Práctico de Django: Aprende Creando 3 Webs', 'Curso Práctico de Django: Aprende Creando 3 Webs', 'Héctor Costa Guzmán', 'https://i.udemycdn.com/course/480x270/1444542_d3b8_3.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(54, 'Master Unreal Engine 4 Desarrollo Videojuegos con Blueprints', 'Aprende a crear Videojuegos AAA DESDE CERO, desarrollo y programación completo con Blueprints y Unreal Engine 4', 'Mariano Rivas', 'https://i.udemycdn.com/course/480x270/1223302_ae33.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(55, 'Curso de Angular 2 en Español - Crea webapps desde cero', 'Aprende a desarrollar aplicaciones web modernas de forma práctica y desde cero con Angular 2, el sucesor de AngularJS', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/707908_13d1_3.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(56, 'Crea sistemas web ASP. Net Core 3.0 MVC, Entity Framework', 'Diseña aplicaciones web en ASP. Net Core 3 MVC y Entity Framework Core, utilizando jquery, AJAX - INCLUYE PROYECTO FINAL', 'Juan Carlos Arcila Díaz', 'https://i.udemycdn.com/course/480x270/1319300_052f_4.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(57, 'JavaScript Moderno Guía Definitiva Construye +15 Proyectos', 'Aprende el lenguaje de programación web más popular paso a paso Con Proyectos, inc. Electron React MongoDB Node Express', 'Juan Pablo De la torre Valdez', 'https://i.udemycdn.com/course/480x270/1509816_dff8.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(58, 'Angular: El mejor curso de Angular. De Cero a Experto!', 'Domina Angular 2 (Angular 8) y crea aplicaciones web del mundo real con TypeScript, Firebase, Cloud Firestore, JWT y más', 'Global Mentoring', 'https://i.udemycdn.com/course/480x270/2105384_9a0f_8.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(59, 'PWA - Aplicaciones Web Progresivas: De cero a experto', 'Notificaciones PUSH, sincronización sin conexión, modos offline, instalaciones, indexedDB, push server, share y más', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1894936_31a7.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(60, 'Aprende a crear tu primer sitio web con Laravel 5.4', 'Curso introductorio a Laravel PHP', 'Jorge García', 'https://i.udemycdn.com/course/480x270/1104380_304c_5.jpg', 199.99, 'c2ac07cafartwetsdAD52356FEDGeXdd5xcN/Bh0p.4jCKrpzhThVJglTr/q', NULL, NULL),
(62, 'curso de php desde cero 2', 'Otro curso para empezar desde cero ', 'Perico', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAT4AAACfCAMAAABX0UX9AAAAaVBMVEWJk8EiJDCNmMcfISw8QFYdHykZGiMVFh4bHSYgIi0XGCEaGyVbYoFOU24TFBuEjrpSWHR9hrBxeZ9XXXtKT2glJzRlbY8vMkJFSmJrc5eGkL1ye6Fka414gKmRm8wqLDs2Ok1BRVwMDBH8Wh8fAAAERElEQVR4nO3b65KiOhQFYNgIAUEBwQu2F5z3f8gh7B0uQnWXTh2pPlnfry5jpnRVkp0Ex3EAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOAZsaU/xi9VleWmLMsE+b2DVoHfUIjvLbSP3EawW/qD/E7p1m3jS5f+IL/TLtDpRXvM3XdQEur4vAfiewedfB1fiMrxFrqjcvyAJvq2tF36XHWea/yuozXosRork51jgvhat/F50vQ4ZZdrl1I97vfYJFf7Ejwrb8wP12F2bnOgS+xyfqbNj9U+4Y7X7XPHWHnJkl9lCVceYGNhsNP5UelP26L4ftZth3imY+DmVg1AuoQzKbjuVucnlWMSrt7H0GYmWh1uvvRX+iQzwPw4jOMw9D2Tw1ofNBT/7bOubdu00ZGj9dt+oW+CjvZLf6VPkhT8MmlltZJB5ZfUTewi0zarUNrajYzEnnHHzVFJuoFVm0Q+1K6vZvORljKbYzOxvdXNbEweHFFwICfnkbnt9i95zYFGd4vikwGm+lduktH6Sya2n3V55PzuoHKcKnjOyqyUW3vuF2RrEh0HI4avCZohduOJrcMSqZKx6lDG0Z4G8fEBWbfaQuqnXug6Mi3ji8NbE9XXUjNWU4fqdozGw4WOB2QzbD/4BZYlKYSXufjkD69vkoBcckiG6DAqGbYWjT6pn6MBI0Ms2FXt6PPqLlqZsfr+SqJdD9Y5s4VU9uz85lI4SApp9lw5zFgtyFSO4T2qhNsUY2tM66e543Ojmyxvh77RM4WXim4c9h250ngrazYuM/Wz2w+Xt8lSJmO1mZ204nGYTNdMi+5WZ+onXSS1XT7ZEvJiqGsJ7WV9HPxbMnctWvpkpA3r55lDa+bzgSd2vyU0M7aZnbIBVP2aSVc+v9j0XMScvM7mBUrvvL6pykzsTR8fz1hdSyZP4CiX8/DWosFn6qc51KaXgNMLT0STykFxXznkCZzpmGeKT2xBYc/gk9kYHdtLk6I8ruW6wLufHXK/qRx8LvZWbb/idDf3NKE9ZdcxKbhRqPndnZ2/T/tC2k1sc+YIyPx2w/WeOob1cl/m82j2MtkNjroiVNPKwTO2OYWkczf8zbh8LPhlPk/q55ivCt0mE3twmSBjVdcSOd2ORHF8sWjmOt0Z3+2eo4WBcrOUn7LVoX5t3UdCrq9fUQcyV1PRsOM9OduVnsxG926e4pZF1T2qJX6x7itHyg9269yc66Kj6bhJqty6Z7xmNhZm+zFK4JtXzG83qtmOtjC/fax+fuvYudvB2Ezq5+spfPGa6f38zv+z3ZspmF/91TZO2Y5J4eWDwvQJnI2kfr6egtyLDu9RLfR+5bDvkdCM9E/7y5XXb5iuW+74X3yo3yMvN1r5cscdd7R76fuH/65m71YZAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGDGXzxYMBAOm+iZAAAAAElFTkSuQmCC', 10, 'c2ac07cafartwetsdAD52356FEDGe4KSShlie7V7Zde55VHfHMymSMhX5i8.', '2024-04-21 09:01:31', '2024-04-21 09:01:31');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
