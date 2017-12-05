-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-01-2017 a las 06:14:48
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `install`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academic_settings`
--

CREATE TABLE IF NOT EXISTS `academic_settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `academic_settings`
--

INSERT INTO `academic_settings` (`settings_id`, `type`, `description`) VALUES
(1, 'limit_upload', ''),
(2, 'report_teacher', '1'),
(3, 'minium_mark', '61'),
(22, 'teacher_average', '1'),
(13, 'minium_average', '80'),
(23, 'max_mark', ''),
(24, 'allowed_marks', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academic_syllabus`
--

CREATE TABLE IF NOT EXISTS `academic_syllabus` (
  `academic_syllabus_id` int(11) NOT NULL AUTO_INCREMENT,
  `academic_syllabus_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `uploader_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`academic_syllabus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `owner_status` int(11) NOT NULL DEFAULT '0' COMMENT '1 owner, 0 not owner',
  `username` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `birthday` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=44 ;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `phone`, `address`, `owner_status`, `username`, `status`, `birthday`) VALUES
(1, 'Steve Jobs', 'steve@eduappgt.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '7767 7767', 'Guatemala', 1, 'admin', 1, '29-12-2016');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0(undefined) 1(present) 2(absent)',
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=618 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attendance_backup`
--

CREATE TABLE IF NOT EXISTS `attendance_backup` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL COMMENT '0 undefined , 1 present , 2  absent',
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `year` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session` longtext NOT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `name_numeric` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `class_routine`
--

CREATE TABLE IF NOT EXISTS `class_routine` (
  `class_routine_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `time_start` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `time_start_min` int(11) NOT NULL,
  `time_end_min` int(11) NOT NULL,
  `day` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`class_routine_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dormitory`
--

CREATE TABLE IF NOT EXISTS `dormitory` (
  `dormitory_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `number_of_room` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dormitory_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enroll`
--

CREATE TABLE IF NOT EXISTS `enroll` (
  `enroll_id` int(11) NOT NULL AUTO_INCREMENT,
  `enroll_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `roll` int(11) NOT NULL DEFAULT '0',
  `date_added` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`enroll_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=66 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `datefrom` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateto` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exams`
--

CREATE TABLE IF NOT EXISTS `exams` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `availablefrom` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `availableto` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `questions` int(11) NOT NULL,
  `pass` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `accesscode` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `exam_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_category`
--

CREATE TABLE IF NOT EXISTS `expense_category` (
  `expense_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`expense_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `section_id` int(11) NOT NULL,
  `post_status` int(11) DEFAULT '1',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forum_message`
--

CREATE TABLE IF NOT EXISTS `forum_message` (
  `message` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `date` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gallery_album`
--

CREATE TABLE IF NOT EXISTS `gallery_album` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_upload` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `photo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gallery_category`
--

CREATE TABLE IF NOT EXISTS `gallery_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `embed` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `homework`
--

CREATE TABLE IF NOT EXISTS `homework` (
  `homework_id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `homework_status` int(11) NOT NULL DEFAULT '1',
  `time_end` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `section_id` int(11) NOT NULL,
  `uploader_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`homework_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_examenes`
--

CREATE TABLE IF NOT EXISTS `horarios_examenes` (
  `horario_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `time_start` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `time_start_min` int(11) NOT NULL,
  `time_end_min` int(11) NOT NULL,
  `day` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fecha` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`horario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_paid` longtext COLLATE utf8_unicode_ci NOT NULL,
  `due` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_timestamp` int(11) NOT NULL,
  `payment_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid',
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `phrase_id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  `spanish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `portuguse` longtext COLLATE utf8_unicode_ci,
  `hindi` longtext COLLATE utf8_unicode_ci,
  `french` longtext COLLATE utf8_unicode_ci,
  `serbian` longtext COLLATE utf8_unicode_ci,
  `arabic` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phrase_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3934 ;

--
-- Volcado de datos para la tabla `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `spanish`, `portuguse`, `hindi`, `french`, `serbian`, `arabic`) VALUES
(386, 'Required', 'Required', 'Obligatorio', 'obrigatório', 'अनिवार्य', 'obligatoire', 'обавезан', 'إلزامي'),
(464, 'Viewing-Report', 'Viewing Report', 'Viendo Reporte', 'visualização de relatórios', 'देखने रिपोर्ट', 'Rapport de visualisation', 'гледање Извештај', 'تقرير عرض'),
(390, 'Admin-Dashboard', 'Admin Dashboard', 'Tablero de Administración', 'Conselho de Administração', 'निदेशक मंडल', 'Conseil d''administration', 'Управни одбор', 'مجلس الإدارة'),
(391, 'Send-Teacher-Files', 'Send files to teachers', 'Enviar archivos a los Profesores', 'Enviar arquivos para Professores', 'शिक्षकों के लिए फाइल को भेजें', 'Envoyer des fichiers aux enseignants', 'Слање датотека на наставнике', 'إرسال الملفات إلى المعلمين'),
(392, 'New-Student', 'Add Student', 'Agregar nuevo estudiante', 'Adicionar novo aluno', 'नए छात्र जोड़े', 'Ajouter un étudiant', 'Додај нови студент', 'إضافة طالب جديد'),
(393, 'Student-Form', 'Registration Form', 'Formulario de registro', 'Formulário de Inscrição', 'पंजीकरण फार्म', 'Formulaire d''inscription', 'Образац за регистрацију', 'استمارة التسجيل'),
(394, 'Report-Teacher-List', 'Teachers reported', 'Profesores Reportados', 'Os professores relataram', 'शिक्षकों की सूचना दी', 'enseignants déclarés', 'nastavnici', 'المعلمين المبلغ عنها'),
(465, 'Students', 'Students', 'Estudiantes', 'estudantes', 'छात्रों', 'étudiants', 'студенти', 'الطلاب'),
(450, 'Delete', 'Delete', 'Eliminar', 'remover', 'हटाना', 'supprimer', 'уклонити', 'نقل'),
(466, 'Class', 'Class', 'Grado', 'grau', 'उपाधि', 'degré', 'степен', 'درجة'),
(461, 'Removed', 'Removed successfully', 'Eliminado Correctamente', 'justamente eliminado', 'सफलतापूर्वक हटा', 'Correctement éliminé', 'С правом елиминисан', 'القضاء بحق'),
(460, 'Updated', 'Successfully updated', 'Actualizado correctamente', 'atualizado com sucesso', 'सफलतापूर्वक अद्यतन', 'mis à jour avec succès', 'успешно ажурирана', 'تحديث بنجاح'),
(453, 'Add', 'Add', 'Agregar', 'adicionar', 'जोड़ना', 'ajouter', 'додати', 'إضافة'),
(467, 'Marks-Of', 'Marks of', 'Calificaciones de', 'classificações', 'रेटिंग्स', 'notes', 'рејтинг', 'تصنيفات'),
(468, 'Student-Promotion', 'Student Promotion', 'Promover Estudiantes', 'Os estudantes que promovem', 'को बढ़ावा देने के छात्र', 'promouvoir les étudiants', 'промовишу Студенти', 'طلاب تعزيز'),
(469, 'Manage-Parents', 'Manage Parents', 'Administrar Padres de familia', 'Gerenciar Pais', 'माता-पिता को प्रबंधित', 'Gérer les parents', 'upravljanje Парентс', 'إدارة الآباء'),
(470, 'Manage-Teachers', 'Manage Teachers', 'Administrar Profesores', 'gerenciar Professores', 'शिक्षकों का प्रबंधन', 'gérer enseignants', 'управљати наставнике', 'إدارة المعلمين'),
(471, 'Manage-Subjects', 'Manage Subjects', 'Administrar Cursos', 'gerenciar cursos', 'पाठ्यक्रम प्रबंधन', 'gérer Cours', 'управљају курсеве', 'إدارة الدورات'),
(472, 'Manage-Classes', 'Manage Classes', 'Administrar Grados', 'gerenciar graus', 'ग्रेड का प्रबंधन', 'gérer les qualités', 'управља степени', 'إدارة الصفوف'),
(473, 'Virtual-Library', 'Virtual Library', 'Librería Virtual', 'biblioteca virtual', 'आभासी पुस्तकालय', 'bibliothèque virtuelle', 'виртуелна библиотека', 'المكتبة الافتراضية'),
(474, 'Manage-Sections', 'Manage Sections', 'Administrar Secciones', 'gerenciar Secções', 'धारा का प्रबंधन', 'gérer Sections', 'управља секција', 'إدارة الأقسام'),
(475, 'Select-None', 'Not selected', 'Sin seleccionar', 'não verificado', 'अनियंत्रित', 'incontrôlé', 'није изабрано', 'دون رادع'),
(476, 'Semesters', 'Semesters', 'Semestres', 'semestres', 'सेमेस्टर', 'semestres', 'семестара', 'فصول دراسية'),
(477, 'Upload-Marks', 'Upload Marks', 'Subir Calificaciones', 'Subir Calificaciones', 'रेटिंग', 'up évaluations', 'Уплоад рејтинг', 'يصل التقييمات'),
(478, 'Marks-by-Subject', 'Marks By Subject', 'Calificaciones por curso', 'Classificações por curso', 'पाठ्यक्रम के अनुसार रेटिंग', 'Évaluations par cours', 'оцене по курсу', 'التقييمات لكل دورة'),
(479, 'Exam-Routine', 'Exam Routine', 'Horarios de Exámenes', 'Períodos de teste', 'परीक्षण के समय', 'Temps d''essai', 'testiranje пута', 'الأوقات العصيبة'),
(480, 'Class-Routine', 'Class Routine', 'Horarios de Clases', 'Tabela de Ramos', 'वर्गों की अनुसूची', 'Horaire des cours', 'Распоред часова', 'الجدول الزمني للفصول'),
(481, 'Attendance', 'Attendance', 'Control de Asistencia', 'atendimento diário', 'नियंत्रण असिस्ट', 'Commande d''assistance', 'Ассист Цонтрол', 'مساعدة تحكم'),
(482, 'Attendance-Report', 'Attendance Report', 'Reporte de Asistencia', 'Relatório de Frequência', 'उपस्थिति रिपोर्ट', 'Participation Rapport', 'prisustvo Извештај', 'تقرير الحضور'),
(483, 'Details', 'Details', 'Detalles', 'detalhes', 'विवरण', 'détails', 'detalji', 'تفاصيل'),
(484, 'Send-News', 'Send News', 'Enviar Noticias', 'enviar Notícia', 'समाचार प्रस्तुत', 'soumettre Nouvelles', 'субмит Невс', 'تقديم الأخبار'),
(500, 'Documents-Teachers', 'Documents for teachers', 'Documentos para los Profesores', 'Documentos para Professores', 'शिक्षकों के लिए दस्तावेज', 'Documents pour les enseignants', 'Документи за наставнике', 'وثائق للمعلمين'),
(487, 'Semester-Content', 'Contents of the semester', 'Contenidos del Semestre', 'conteúdo Semestre', 'सामग्री सेमेस्टर', 'Contenu Semestre', 'Садржај семестра', 'محتويات الفصل الدراسي'),
(488, 'Students-Payments', 'Student Payments', 'Pagos Mensuales', 'Os pagamentos mensais', 'मासिक भुगतान', 'Les paiements mensuels', 'месечних рата', 'دفعات شهرية'),
(489, 'Expense', 'Expense', 'Egresos', 'despesa', 'व्यय', 'dépense', 'трошак', 'إنفاق'),
(490, 'Expense-Category', 'Expense Category', 'Categorías de Egresos', 'Categorias de despesas', 'व्यय श्रेणियों', 'Catégories de dépenses', 'kategorije трошкова', 'فئات الإنفاق'),
(491, 'Manage-School-Bus', 'Manage School Bus', 'Administrar bus escolar', 'Gerenciar ônibus escolar', 'स्कूल बस का प्रबंधन', 'Gérer les autobus scolaires', 'Управљање школски аутобус', 'إدارة الحافلات المدرسية'),
(492, 'Manage-Classrooms', 'Manage Classrooms', 'Administrar salones de clases', 'Gerenciar salas de aula', 'कक्षाओं की व्यवस्था करें', 'Gérer les salles de classe', 'upravljanje учионице', 'إدارة الفصول الدراسية'),
(493, 'Message-Sent', 'Message sent correctly', 'Mensaje Enviado ', 'Mensagem enviada', 'संदेश भेजा', 'Message envoyé', 'poruka послата', 'رسالة أرسلت'),
(494, 'Private-Messages', 'Private Messages', 'Mensajes Privados', 'mensagens privadas', 'निजी संदेश', 'messages privés', 'приватне поруке', 'رسائل خاصة'),
(495, 'System-Updated', 'System Updated', 'Sistema Actualizado', 'sistema atualizado', 'अद्यतन प्रणाली', 'Mise à jour du système', 'ажуриран систем', 'النظام المحدثة'),
(497, 'System-Settings', 'System Settings', 'Ajustes del Sistema', 'Configurações do sistema', 'सिस्टम सेटिंग्स', 'Paramètres système', 'Систем Сеттингс', 'إعدادات النظام'),
(499, 'Admins', 'Admins', 'Administradores', 'administradores', 'प्रशासकों', 'administrateurs', 'администратори', 'الإداريين'),
(505, 'Password-Error', 'Password Error', 'La contraseña no coincide', 'A senha não corresponde', 'पासवर्ड मेल नहीं खाता', 'Le mot de passe ne correspond pas', 'Лозинка не одговара', 'لا تطابق كلمة المرور'),
(506, 'My-Profile', 'My Profile', 'Mi Perfil', 'Meu perfil', 'मेरी प्रोफाइल', 'Mon profil', 'мој профил', 'الملف الشخصي الخاص بي'),
(507, 'Search-Result', 'Search Result', 'Resultados de la Búsqueda', 'resultados da pesquisa', 'खोज परिणाम', 'Résultats de la recherche', 'Резултати претраге', 'نتائج البحث'),
(508, 'Events', 'Events Calendar', 'Calendario de Eventos', 'Calendário de Eventos', 'घटनाओं का कैलेंडर', 'Calendrier des événements', 'Календар догађаја', 'أجندة الفعاليات'),
(509, 'Welcome', 'Welcome', 'Bienvenido', 'bem-vindo', 'स्वागत', 'bienvenue', 'добродошао', 'ترحيب'),
(511, 'Messages', 'Messages', 'Mensajes', 'mensagens', 'पदों\n', 'messages', 'порука', 'المشاركات'),
(512, 'Profile', 'Profile', 'Perfil', 'perfil', 'प्रोफ़ाइल', 'profil', 'профил', 'البيانات الشخصية'),
(513, 'Exit', 'Logout', 'Salir', 'saída', 'निकास', 'Sortir', 'логоут', 'خروج'),
(514, 'Search-by-name', 'Search Student', 'Buscar estudiante por nombre', 'Pesquisa aluno pelo nome', 'नाम से खोजें छात्र', 'Rechercher étudiant par nom', 'Студента по имену', 'طالب في البحث عن طريق الاسم'),
(520, 'Create-Payment', 'Create Invoice', 'Realizar cobro', 'realizar a coleta', 'संग्रह में प्रदर्शन', 'effectuer la collecte', 'извршити наплату', 'أداء مجموعة'),
(516, 'Dashboard', 'Dashboard', 'Tablero', 'placa', 'बोर्ड', 'conseil', 'табла', 'مجلس'),
(518, 'School-Bus', 'School Bus', 'Bus Escolar', 'Ônibus escolar', 'स्कूल बस', 'Autobus scolaire', 'школски аутобус', 'حافلة مدرسية'),
(521, 'Payments-Sent', 'Invoices', 'Cobros enviados', 'Os rendimentos enviados', 'आय भेजा', 'Produit envoyé', 'prihodi послао', 'عائدات أرسلت'),
(530, 'User-Account', 'Users Accounts', 'Cuentas de Usuarios', 'Contas de usuário', 'उपयोगकर्ता खाते', 'Comptes d''utilisateurs', 'Усер Аццоунтс', 'حسابات المستخدمين'),
(531, 'Teachers', 'Teachers', 'Profesores', 'professores', 'शिक्षकों', 'enseignants', 'мајстори', 'معلمون'),
(532, 'Parents', 'Parents', 'Padres', 'pais', 'माता-पिता', 'parents', 'родитељи', 'الآباء'),
(533, 'Student-Information', 'Student Information', 'Información de los Estudiantes', 'Informações do estudante', 'छात्र सूचना', 'Information sur les étudiants', 'студент informacije', 'معلومات الطالب'),
(534, 'Teachers-Files', 'Teacher Files', 'Archivos para profesores', 'Arquivos de professores', 'शिक्षक फ़ाइलें', 'Fichiers d''enseignants', 'Теацхер Бр', 'ملفات المعلم'),
(535, 'Daily-Attendance', 'Daily Attendance', 'Asistencia Diaria', 'atendimento diário', 'दैनिक उपस्थिति', 'présence quotidienne', 'Дневни присуство', 'الحضور اليومي'),
(536, 'Subjects', 'Subjects', 'Cursos', 'cursos', 'पाठ्यक्रम', 'cours', 'курсеви', 'الدورات'),
(537, 'Schedules', 'Schedules', 'Horarios', 'horário', 'समय सारिणी', 'calendrier', 'распоред', 'جدول مواعيد'),
(538, 'Qualifications', 'Marks', 'Calificaciones', 'classificações', 'रेटिंग्स', 'notes', 'рејтинг', 'تصنيفات'),
(539, 'Academic-Files', 'Academic Files', 'Archivos Académicos', 'arquivos acadêmicos', 'एकेडमिक फ़ाइलें', 'fichiers académiques', 'Ацадемиц фајлова', 'ملفات الأكاديمية'),
(540, 'News-Sent', 'Sent News', 'Noticias Enviadas', 'Notícias submetidas', 'प्रस्तुत समाचार', 'Nouvelles Soumis', 'Субмиттед Новости', 'الأخبار المقدمة'),
(541, 'Accounting', 'Accounting', 'Contabilidad', 'contabilidade', 'लेखांकन', 'comptabilité', 'рачуноводство', 'المحاسبة'),
(542, 'Reports', 'Academic Reports', 'Reportes Académicos', 'relatórios académicos', 'एकेडमिक रिपोर्टों', 'rapports académiques', 'Ацадемиц извештаји', 'التقارير الأكاديمية'),
(543, 'Teacher-Report', 'Teacher Report', 'Reportes de Profesores', 'relatórios Professores', 'रिपोर्ट शिक्षक', 'Rapports enseignants', 'Извештаји Наставници', 'المعلمون تقارير'),
(544, 'Student-Report', 'Student Report', 'Reportes de Estudiantes', 'Relatórios de estudante', 'विद्यार्थी रिपोर्ट', 'Rapports d''étudiants', 'Студент Извештаји', 'تقارير طالب'),
(545, 'News', 'News', 'Noticias', 'notícia', 'समाचार', 'nouvelles', 'новости', 'أخبار'),
(547, 'View-All', 'View All', 'Ver todo', 'ver todos', 'सभी देखते हैं', 'voir tous', 'види све', 'ترى كل'),
(548, 'Go-to-site', 'Go to website', 'Ir al sitio', 'Ir para o site', 'साइट पर जाएं', 'Accéder au site', 'Иди на сајту', 'انتقل إلى موقع'),
(549, 'Login', 'Login', 'Acceder', 'log in', 'लोग इन', 'connectez-vous', 'лог ин', 'تسجيل الدخول'),
(550, 'Password', 'Password', 'Contraseña', 'senha', 'पासवर्ड', 'mot de passe', 'лозинка', 'كلمة المرور'),
(551, 'Username', 'Username', 'Usuario', 'usuário', 'उपयोगकर्ता', 'utilisateur', 'корисник', 'المستخدم'),
(552, 'Close', 'Close', 'Cerrar', 'perto', 'निकट', 'Fermer', 'близу', 'قريب'),
(553, 'Cancel', 'Cancel', 'Cancelar', 'cancelar', 'रद्द करना', 'annuler', 'отказати', 'إلغاء'),
(554, 'Are-you-sure', 'Are you sure you want to do this?', '¿Seguro que quieres hacer esto?', 'Tem certeza de que quer fazer isso?', 'आप ऐसा करना चाहते हैं आप सुनिश्चित हैं?', 'Êtes-vous sûr de vouloir faire ça?', 'Да ли сте сигурни да желите да урадите ово?', 'هل أنت متأكد أنك تريد أن تفعل هذا؟'),
(555, 'Date', 'Date', 'Fecha', 'data', 'तिथि', 'date', 'датум', 'تاريخ'),
(557, 'Name', 'Name', 'Nombre', 'nome', 'नाम', 'nom', 'име', 'اسم'),
(558, 'Description', 'Description', 'Descripción', 'descrição', 'विवरण', 'description', 'опис', 'وصف'),
(559, 'Options', 'Options', 'Opciones', 'opções', 'विकल्प', 'Options', 'opcije', 'خيارات'),
(560, 'Download', 'Download', 'Descargar', 'baixar', 'डाउनलोड', 'télécharger', 'Довнлоад', 'تحميل'),
(561, 'Upload-Files', 'Upload Files', 'Subir Archivos', 'fazer upload de arquivos', 'अपलोड फ़ाइलों', 'Télécharger des fichiers', 'Уплоад фајлова', 'تحميل الملفات'),
(564, 'Subject', 'Subject', 'Curso', 'curso', 'कोर्स', 'Cours', 'курс', 'مسار'),
(563, 'Upload-Book', 'Upload Book', 'Subir Libro', 'up livro', 'बुक', 'up Book', 'уп књига', 'حتى كتاب'),
(565, 'Select', 'Select', 'Seleccione', 'selecionar', 'चुनना', 'sélectionner', 'одабрати', 'اختر'),
(566, 'Title', 'Title', 'Título', 'título', 'शीर्षक', 'titre', 'наслов', 'لقب'),
(567, 'Book', 'Book', 'Libro', 'livro', 'किताब', 'livre', 'књига', 'كتاب'),
(568, 'Autor', 'Author', 'Autor', 'autor', 'लेखक', 'auteur', 'аутор', 'مؤلف'),
(569, 'Search', 'Search', 'Buscar', 'pesquisa', 'खोज', 'recherche', 'претраживање', 'بح'),
(570, 'Day', 'Day', 'Día', 'Dia', 'दिन', 'jour', 'дан', 'يوم'),
(571, 'Sunday', 'Sunday', 'Domingo', 'domingo', 'रविवार', 'dimanche', 'недеља', 'الأحد'),
(572, 'Monday', 'Monday', 'Lunes', 'segunda-feira', 'सोमवार', 'Lundi', 'понедељак', 'الإثنين'),
(573, 'Tuesday', 'Tuesday', 'Martes', 'terça-feira', 'मंगलवार', 'mardi', 'уторак', 'الثلاثاء'),
(574, 'Wednesday', 'Wednesday', 'Miercoles', 'quarta-feira', 'बुधवार', 'mercredi', 'среда', 'الأربعاء'),
(575, 'Thursday', 'Thursday', 'Jueves', 'quinta-feira', 'बृहस्पतिवार', 'jeudi', 'четвртак', 'الخميس'),
(576, 'Friday', 'Friday', 'Viernes', 'sexta-feira', 'शुक्रवार', 'vendredi', 'петак', 'الجمعة'),
(577, 'Saturday', 'Saturday', 'Sabado', 'sábado', 'शनिवार', 'samedi', 'субота', 'السبت'),
(578, 'Start', 'Start', 'Inicio', 'iniciação', 'दीक्षा', 'Début', 'иницирање', 'استهلال'),
(579, 'Hour', 'Hour', 'Hora', 'tempo', 'समय', 'temps', 'време', 'وقت'),
(580, 'Minutes', 'Minutes', 'Minutos', 'atas', 'मिनटों', 'procès-verbal', 'записник', 'دقيقة'),
(581, 'End', 'End', 'Fin', 'final', 'अंत', 'fin', 'крај', 'نهاية'),
(582, 'Email', 'Email', 'Correo', 'correio', 'मेल', 'courrier', 'пошта', 'بريد'),
(583, 'Phone', 'Phone', 'Celular', 'celular', 'सेलुलर', 'cellulaire', 'ћелијски', 'خلوي'),
(584, 'Address', 'Address', 'Dirección', 'endereço', 'पता', 'adresse', 'адреса', 'عنوان'),
(585, 'Type-Account', 'Account Type', 'Tipo de cuenta', 'Tipo de conta', 'खाते का प्रकार', 'Type de compte', 'Тип рачун', 'نوع الحساب'),
(586, 'Photo', 'Photo', 'Fotografía', 'fotografia', 'फोटोग्राफी', 'photographie', 'фотографија', 'تصوير'),
(587, 'Upload', 'Upload', 'Subir', 'carregar', 'अपलोड', 'télécharger', 'отпремање', 'تحميل'),
(588, 'Admin', 'Admin', 'Administrador', 'Gestor', 'प्रशासक', 'administrateur', 'Администратор', 'مدير'),
(589, 'Super-Admin', 'Super Administrator', 'Super Administrador', 'Super Gestor', 'सुपर व्यवस्थापक', 'super administrateur', 'супер Манагер', 'مدير سوبر'),
(590, 'Update', 'Update', 'Actualizar', 'atualizar', 'अद्यतन', 'mettre à jour', 'ажурирање', 'تحديث'),
(591, 'Change', 'Change', 'Cambiar', 'mudança', 'परिवर्तन', 'Changer', 'промена', 'تغيير'),
(592, 'Account-Status', 'Account Status', 'Estado de la cuenta', 'Estado da conta', 'खाते की स्थिति', 'Statut du compte', 'Статус налога', 'حالة الحساب'),
(593, 'Status', 'Status', 'Estado', 'estado', 'राज्य', 'état', 'држава', 'دولة'),
(594, 'Active', 'Active', 'Activa', 'Activa', 'एक्टिवा', 'Activa', 'ацтива', 'نشط'),
(595, 'Inactive', 'Inactive', 'Inactiva', 'inativo', 'निष्क्रिय', 'inactif', 'неактиван', 'غير فعال'),
(596, 'Parent', 'Parent', 'Padre', 'pai', 'पिता', 'père', 'отац', 'الأب'),
(597, 'Section', 'Section', 'Sección', 'seção', 'अनुभाग', 'section', 'одељак', 'قسم'),
(598, 'Select-Class', 'Select Class', 'Primero seleccione el grado', 'Primeiro, selecione a nota', 'पहली कक्षा का चयन', 'Sélectionnez d''abord la note', 'Прво изаберите разред', 'أولا حدد الصف'),
(599, 'Roll', 'Roll', 'Carné', 'Carné', 'रोल', 'rouleau', 'Карне', 'كارنيه'),
(600, 'Birthday', 'Birthday', 'Cumpleaños', 'aniversário', 'जन्मदिन', 'anniversaire', 'рођендан', 'عيد ميلاد'),
(601, 'Sex', 'Sex', 'Género', 'sexo', 'लिंग', 'sexe', 'секс', 'جنس'),
(602, 'Male', 'Male', 'Masculino ', 'masculino', 'नर', 'Masculin', 'мушки', 'ذكر'),
(603, 'Female', 'Female', 'Femenino', 'feminino', 'महिला', 'Féminin', 'женски', 'أنثى'),
(604, 'Living-Assigned', 'Living Assigned', 'Salón asignado', 'Salão atribuído', 'हॉल सौंपा', 'attribué Salle', 'додељен сала', 'قاعة المخصصة'),
(605, 'View', 'View', 'Ver', 'ver', 'देखना', 'Voir', 'видети', 'شاهد'),
(606, 'Archived', 'Archive', 'Archivar', 'arquivo', 'फ़ाइल', 'fichier', 'фајл', 'ملف'),
(607, 'Unarchived', 'Unarchives', 'Desarchivar', 'desarmazenando', 'गैर अभिलेख', 'désarchivage', 'Опозив архивирања', 'unArchiving'),
(608, 'Add-Event', 'Add event', 'Agregar Evento', 'Adicionar evento', 'घटना जोड़ें', 'Ajouter un événement', 'Додај догађај', 'إضافة حدث'),
(609, 'Color', 'Colour', 'Color del Evento', 'Cor do evento', 'रंग घटना', 'Couleur de l''événement', 'боја догађаја', 'حدث اللون'),
(610, 'Red', 'Red', 'Rojo', 'vermelho', 'लाल', 'Rouge', 'црвен', 'أحمر'),
(611, 'Orange', 'Orange', 'Naranja', 'laranja', 'नारंगी', 'Orange', 'поморанџа', 'البرتقالي'),
(612, 'Black', 'Black', 'Negro', 'preto', 'काला', 'noir', 'црн', 'أسود'),
(613, 'Blue', 'Blue', 'Azul', 'Azul', 'नीला', 'bleu', 'плава', 'أزرق'),
(614, 'Green', 'Green', 'Verde', 'verde', 'ग्रीन', 'vert', 'зелен', 'أخضر'),
(615, 'Edit', 'Edit', 'Editar', 'editar', 'संपादित', 'éditer', 'уреди', 'تحرير'),
(617, 'Return', 'Return', 'Regresar', 'retorno', 'वापसी', 'retour', 'повратак', 'عودة'),
(618, 'Year', 'Running Year', 'Año en curso', 'Ano', 'साल', 'Année', 'година', 'عام'),
(619, 'Titular-Teacher', 'Titular Teacher', 'Profesor Titular', 'professor de sala', 'प्रोफ़ेसर', 'professeur', 'мајстор Власник', 'أستاذ'),
(620, 'Numeric-Name', 'Numeric Name', 'Nombre Numérico ', 'nome numérico', 'संख्यात्मक नाम', 'nom numérique', 'Бројни име', 'اسم رقمية'),
(622, 'Classes', 'Classes', 'Grados', 'graus', 'ग्रेड', 'grades', 'оцене', 'الدرجات'),
(623, 'New', 'New', 'Nuevo', 'novo', 'नई', 'nouveau', 'нови', 'جديد'),
(624, 'Salons', 'Salons', 'Salones', 'salons', 'सैलून', 'Salons', 'салони', 'صالونات'),
(625, 'Salon', 'Salon', 'Salón', 'salão', 'सैलून', 'salon', 'салон', 'صالون'),
(626, 'Write-Comment', 'Write your comment here', 'Escribe tu comentario aquí', 'Escreva o seu comentário aqui', 'अपनी टिप्पणी यहाँ लिखें', 'Écrivez votre commentaire ici', 'Напишите ваш коментар овде', 'اكتب تعليقك هنا'),
(627, 'Send', 'Send', 'Enviar', 'enviar', 'भेजना', 'envoyer', 'послати', 'إرسال'),
(628, 'Teacher', 'Teacher', 'Profesor', 'mestre', 'प्रोफ़ेसर', 'professeur', 'мајстор', 'أستاذ'),
(629, 'Subject-Activity', 'Subject Activity', 'Actividades del Curso', 'As atividades do curso', 'पाठ्यक्रम गतिविधियों', 'Les activités du cours', 'kurs активности', 'أنشطة بالطبع'),
(630, 'Final-Exam', 'Final Exam', 'Examen Final', 'Exame final', 'अंतिम परीक्षा', 'Examen final', 'Завршни испит', 'إمتحان نهائي'),
(631, 'Prev', 'Previous', 'Anterior', 'anterior', 'पूर्व', 'précédent', 'претходна', 'سابق'),
(632, 'Next', 'Next', 'Siguiente', 'seguinte', 'निम्नलिखित', 'suivante', 'следећи', 'التالي'),
(633, 'Total-Users', 'Total Users', 'Usuarios Totales', 'total de usuários', 'कुल उपयोगकर्ताओं', 'total des utilisateurs', 'total Мемберс', 'إجمالي المستخدمين'),
(634, 'Update-Logo', 'Update Logo', 'Actualizar Logotipo', 'logotipo atualização', 'अद्यतन लोगो', 'mise à jour logo', 'ажурирање лого', 'شعار التحديث'),
(635, 'Logo', 'Logotype', 'Logotipo', 'logotipo', 'लोगो', 'logo', 'лого', 'شعار'),
(636, 'Calendar', 'Calendar', 'Calendario', 'calendário', 'कैलेंडर', 'calendrier', 'календар', 'تقويم'),
(638, 'Documents', 'Documents', 'Documentos', 'documentos', 'दस्तावेजों', 'documents', 'документи', 'وثائق'),
(639, 'File', 'File', 'Archivo', 'arquivo', 'पुरालेख', 'archives', 'Архива', 'أرشيف'),
(640, 'File-Type', 'Type of file', 'Tipo de archivo', 'Tipo de arquivo', 'फाइल प्रकार', 'Type de fichier', 'филе типе', 'نوع الملف'),
(641, 'Pdf', 'PDF', 'PDF', 'PDF', 'पीडीएफ', 'PDF', 'пдф', 'PDF'),
(642, 'Other', 'Other', 'Otro', 'outro', 'अन्य', 'autre', 'други', 'آخر'),
(643, 'Excel', 'Excel', 'Excel', 'sobressair', 'एक्सेल', 'exceller', 'екцел', 'تفوق'),
(646, 'Amount', 'Amount', 'Monto', 'quantidade', 'मात्रा', 'montant', 'износ', 'كمية'),
(645, 'Category', 'Category', 'Categoría', 'categoria', 'श्रेणी', 'catégorie', 'категорија', 'فئة'),
(647, 'Method', 'Method', 'Método', 'método', 'विधि', 'méthode', 'метод', 'طريقة'),
(648, 'Cash', 'Cash', 'Efectivo', 'Dinheiro', 'रोकड़', 'Espèces', 'ефикасан', 'فعال'),
(649, 'Check', 'Check', 'Cheque', 'Cheque bancário', 'बैंक चेक', 'Chèque bancaire', 'проверити', 'تحقق'),
(650, 'Card', 'Credit Card', 'Tarjeta', 'cartão', 'कार्ड', 'carte', 'картица', 'بطاقة'),
(651, 'New-Category', 'New Category', 'Nueva Categoría', 'novo Categoria', 'नई श्रेणी', 'nouvelle catégorie', 'nova категорија', 'جديد الفئة'),
(652, 'New-Expense', 'New Expense', 'Nuevo Egreso', 'nova Exit', 'नई निकलें', 'nouvelle sortie', 'нови излаз', 'خروج جديد'),
(653, 'Income', 'Income', 'Cobros', 'colecções', 'संग्रह', 'collections', 'колекције\n', 'مجموعات'),
(654, 'New-Income', 'New Income', 'Nuevo Cobro', 'nova coleção', 'नया संग्रह', 'nouvelle collection', 'nova колекција', 'مجموعة جديدة'),
(655, 'Report', 'Report', 'Reportes', 'relatórios', 'रिपोर्टों', 'rapports', 'извештаји', 'تقارير'),
(656, 'Update-Password', 'Update Password', 'Cambiar contraseña', 'alteração de senha', 'पासवर्ड बदलें', 'Changer le mot de passe', 'promena лозинке\n', 'تغيير كلمة المرور'),
(657, 'Current-Password', 'Current Password', 'Contraseña actual', 'Senha atual', 'वर्तमान पासवर्ड', 'mot de passe actuel', 'тренутна лозинка', 'كلمة المرور الحالية'),
(658, 'New-Password', 'New Password', 'Nueva contraseña', 'Nova senha', 'नया पासवर्ड', 'nouveau mot de passe', 'нова лозинка', 'كلمة سر جديدة'),
(659, 'Confirm-Password', 'Confirm new Password', 'Repita nueva contraseña', 'Repita nova senha', 'दोहराएँ नया पासवर्ड', 'Répéter nouveau mot de passe', 'Поновите нову лозинку', 'كلمة مرور جديدة كرر'),
(660, 'About', 'About', 'Acerca de mi', 'Sobre mim', 'मेरे बारे में', 'À propos de moi', 'О мени', 'معلومات عني'),
(661, 'Update-Profile', 'Update my Profile', 'Actualizar mi perfil', 'Atualizar o meu perfil', 'अद्यतन मेरा प्रोफ़ाइल', 'Mettre à jour mon profil', 'Упдате Ми Профиле', 'تحديث ملفي الشخصي'),
(662, 'School-Ads', 'Quick School Ads', 'Anuncios del Colegio', 'Anúncios escolares', 'स्कूल घोषणाएँ', 'Annonces scolaires', 'Школски Најаве', 'مدرسة الإعلانات'),
(663, 'Important', 'Important Information', 'Información Importante', 'Informação importante', 'महत्वपूर्ण जानकारी', 'informations importantes', 'Важне информације', 'معلومات هامة'),
(664, 'Go-to-news', 'Go to News', 'Ir a las noticias', 'Ir para notícias', 'खबर के लिए जाओ', 'Aller aux nouvelles', '\nИди на вести', 'انتقل إلى أخبار'),
(665, 'Total', 'Total', 'Total', 'total', 'संपूर्ण', 'total', 'укупан', 'مجموع'),
(667, 'Print-Marks', 'Print', 'Imprimir', 'impressão', 'छाप', 'imprimer', 'штампа', 'طباعة'),
(668, 'Semester', 'Semester', 'Semestre', 'semestre', 'छमाही', 'semestre', 'семестар', 'نصف السنة'),
(669, 'Student', 'Student', 'Estudiante', 'estudante', 'छात्र', 'étudiant', 'ученик', 'طالب'),
(670, 'Total-Marks', 'Total Marks', 'Puntos Acumulados', 'pontos acumulados', 'उपार्जित अंक', 'Les points accumulés', 'Обрачунати бодова', 'نقاط مستحقة'),
(671, 'Select-to-continue', 'Select to continue', 'Seleccione uno para continuar', 'Selecione um para continuar', 'जारी रखने के लिए एक का चयन करें', 'Sélectionnez l''une pour continuer', 'Изаберите једну за наставак', 'اختر واحدا لمواصلة'),
(672, 'Receiver', 'Receiver', 'Receptor', 'recebedor', 'रिसीवर', 'récepteur', 'пријемник', 'المتلق'),
(673, 'Select-User', 'Select user', 'Seleccione un usuario', 'Selecione um usuário', 'एक उपयोगकर्ता का चयन करें', 'Sélectionnez un utilisateur', 'Изаберите корисника', 'تحديد مستخدم'),
(674, 'Write-Message', 'Write your message', 'Escribe tu mensaje aquí', 'Faça aqui a sua mensagem', 'यहाँ अपना संदेश लिखें', 'Écrivez votre message ici', 'Напишите своју поруку овде', 'اكتب رسالتك هنا'),
(675, 'Reply', 'Reply', 'Responder', 'resposta', 'उत्तर', 'réponse', 'одговор', 'إجابة'),
(685, 'Enrollment-bus', 'Enrollment bus', 'Matrícula del bus', 'Autocarro de matrícula', 'ट्यूशन बस', 'Bus de scolarité', 'Школарина аутобус', 'حافلة الدراسية'),
(686, 'Driver-Name', 'Driver name', 'Nombre del Piloto', 'nome Pilot', 'नाम पायलट', 'Nom Pilot', 'ime пилот', 'اسم الطيار'),
(687, 'Driver-Phone', 'Driver phone', 'Celular', 'celular', 'सेलुलर', 'cellulaire', 'ћелијски', 'خلوي'),
(684, 'Route', 'Route', 'Ruta', 'rota', 'मार्ग', 'route', 'рута', 'طريق'),
(707, 'Save', 'Save', 'Guardar', 'salvar', 'बचाना', 'Garder', 'сачувати', 'حفظ'),
(705, 'Comment', 'Comment', 'Comentar', 'comentário', 'टिप्पणी', 'Commenter', 'коментар', 'تعليق'),
(706, 'Untitle', 'Untitled', 'Sin título ', 'sem título', 'शीर्षकहीन', 'Sans titre', 'Без', 'بدون عنوان'),
(703, 'Running', 'Active', 'Activas', 'ativo', 'सक्रिय', 'actif', 'активан', 'نشط'),
(704, 'Archiveds', 'Archived', 'Archivadas', 'arquivados', 'संग्रहीत', 'archivé', 'архивиране', 'أرشفة'),
(709, 'To-Year', 'Promotion to year', 'Año a promover', 'Ano para promover', 'वर्ष बढ़ावा देने के लिए', 'Année de promouvoir', 'Године да промовише', 'العام لتعزيز'),
(710, 'To-Class', 'Promotion to class', 'Grado a promover', 'Grau de promover', 'बढ़ावा देने के लिए डिग्री', 'Degré de promouvoir', 'Степен да промовише', 'درجة لتعزيز'),
(711, 'Code', 'Code', 'Código', 'código', 'कोड', 'code', 'код', 'قانون'),
(712, 'Priority', 'Priority', 'Prioridad', 'prioridade', 'प्राथमिकता', 'priorité', 'приоритет', 'أفضلية'),
(713, 'Month', 'Month', 'Mes', 'mês', 'महीना', 'mois', 'месец', 'شهر'),
(714, 'January', 'January', 'Enero', 'janeiro', 'जनवरी', 'janvier', 'јануар', 'يناير'),
(715, 'February', 'February', 'Febrero', 'fevereiro', 'फरवरी', 'février', 'фебруар', 'فبراير'),
(716, 'March', 'March', 'Marzo', 'março', 'मार्च', 'mars', 'март', 'مارس'),
(717, 'April', 'April', 'Abril', 'abril', 'अप्रैल', 'avril', 'април', 'أبريل'),
(718, 'May', 'May', 'Mayo', 'maio', 'मई', 'mai', 'мај', 'مايو'),
(719, 'June', 'June', 'Junio', 'Junho', 'जून', 'juin', 'јун', 'يونيو'),
(720, 'July', 'July', 'Julio', 'Julho', 'जुलाई', 'juillet', 'јул', 'يوليو'),
(721, 'August', 'August', 'Agosto', 'Agosto', 'अगस्त', 'août', 'август', 'أغسطس'),
(722, 'October', 'October', 'Octubre', 'outubro', 'अक्टूबर', 'octobre', 'октобар', 'أكتوبر'),
(723, 'November', 'November', 'Noviembre', 'novembro', 'नवंबर', 'novembre', 'новембар', 'تشرين الثاني'),
(724, 'December', 'December', 'Diciembre', 'dezembro', 'दिसंबर', 'décembre', 'децембар', 'ديسمبر'),
(725, 'September', 'September', 'Septiembre', 'setembro', 'सितंबर', 'septembre', 'септембар', 'سبتمبر'),
(726, 'Profession', 'Profession', 'Profesión', 'profissão', 'व्यवसाय', 'profession', 'професија', 'مهنة'),
(727, 'Not-Found', 'Not found', 'Sin resultados', 'nenhum resultado', 'कोई परिणाम नहीं', 'Aucun résultat', 'Нема резултата', 'لا يوجد نتائج'),
(728, 'Nick', 'Nickname', 'Nick', 'entalhe', 'छेद', 'entailler', 'ницк', 'شق'),
(732, 'Payment-Information', 'Payment Information', 'Información del cobro', 'Coleta de informações', 'सूचना संग्रह', 'Collecte d''informations', 'prikupljanje информација', 'جمع المعلومات'),
(731, 'Information', 'Information', 'Información', 'informação', 'सूचना', 'information', 'информације', 'معلومات'),
(737, 'Promotion-Selected', 'Promote the selected students', 'Promover a los estudiantes seleccionados', 'Promover os alunos selecionados', 'चयनित छात्रों को बढ़ावा देना', 'Promouvoir les étudiants sélectionnés', 'Промовисати изабране студенте', 'تشجيع الطلاب الذين تم اختيارهم'),
(734, 'Promotion-to', 'Promotion to', 'Promover a', 'promover', 'को बढ़ावा देने के', 'promouvoir', 'унапредити', 'تعزيز'),
(736, 'Already', 'Already it promoted', 'Ya se ha promovido', 'Já promoveu', 'पहले से ही यह पदोन्नत', 'Déjà il a encouragé', 'Већ је промовисао', 'بالفعل روجت'),
(738, 'System-Name', 'System name', 'Nombre del Sistema', 'Name System', 'सिस्टम का नाम', 'Name System', 'систем Име', 'اسم النظام'),
(739, 'System-Title', 'System title', 'Título del sistema', 'título Sistema', 'शीर्षक प्रणाली', 'Titre système', 'Наслов систем', 'عناوين النظام'),
(740, 'Minium-Mark', 'Minimum mark', 'Nota minima', 'Nota mínima', 'न्यूनतम नोट', 'minimum Remarque', 'минимална Напомена', 'الحد الأدنى ملاحظة'),
(741, 'Domain', 'Domain name', 'Dominio', 'domínio', 'डोमेन', 'domaine', 'домен', 'Dominio'),
(742, 'Currency', 'Currency', 'Moneda', 'moeda', 'मुद्रा', 'monnaie', 'валута', ''),
(743, 'Slider1', 'Salider 1 - 1920px - 570px', 'Slider 1 - 1920px - 570px', 'Slider 1 - 1920px - 570px', 'Slider 1 - 1920px - 570px', 'Slider 1 - 1920px - 570px', 'клизач 1 - 1920px - 570px', 'Slider 1 - 1920px - 570px'),
(744, 'Slider2', 'Salider 2 - 1920px - 570px', 'Slider 2 - 1920px - 570px', 'Slider 2 - 1920px - 570px', 'Slider 2 - 1920px - 570px', 'Slider 2 - 1920px - 570px', 'клизач 2 - 1920px - 570px', 'Slider 2 - 1920px - 570px'),
(745, 'Slider3', 'Salider 3 - 1920px - 570px', 'Slider 3 - 1920px - 570px', 'Slider 3 - 1920px - 570px', 'Slider 3 - 1920px - 570px', 'Slider 3 - 1920px - 570px', 'клизач 3 - 1920px - 570px', 'Slider 3 - 1920px - 570px'),
(746, 'List', 'List', 'Listado', 'listagem', 'लिस्टिंग', 'inscription', 'списак', 'قائمة'),
(749, 'By', 'By', 'Por', 'por', 'द्वारा', 'Par', 'по', 'بواسطة'),
(748, 'Salary', 'Salary', 'Salario', 'salário', 'वेतन', 'salaire', 'плата', 'أجرة'),
(750, 'Present', 'Present', 'Presente', 'presente', 'वर्तमान', 'présent', 'поклон', 'حاضر'),
(751, 'Absent', 'Absent', 'Ausente', 'ausente', 'अनुपस्थित', 'absent', 'одсутан', 'غائب'),
(752, 'Homework-Of', 'Homework of', 'Tareas de', 'tarefas', 'कार्यों', 'tâches', 'задаци', 'المهام'),
(753, 'Student-Dashboard', 'Student Dashboard', 'Tablero de Estudiante', 'Placa de estudante', 'छात्र बोर्ड', 'Conseil étudiant', 'студент одбор', 'مجلس الطلبة'),
(754, 'Your-Marks', 'these are your marks', 'estas son tus calificaciones', 'estas são as suas notas', 'ये अपने योग्यता हैं', 'ce sont vos qualifications', 'то су ти оцене', 'هذه هي مؤهلاتك'),
(755, 'My-Homework', 'My homework', 'Mis tareas', 'Minhas tarefas', 'मेरा कार्य', 'Mes tâches', 'Моји задаци', 'مهامي'),
(756, 'Teacher-Dashboard', 'Teacher Dashboard', 'Tablero de Profesores', 'professores Board', 'शिक्षक बोर्ड', 'Les enseignants Conseil', 'nastavnici одбор', 'مجلس المعلمين'),
(757, 'Students-Of', 'Students Of', 'Estudiantes de', 'estudantes', 'छात्रों', 'étudiants', 'студенти', 'الطلاب'),
(758, 'Send-Homework', 'Send Homework', 'Enviar Tareas', 'Enviar Tarefas', 'कार्य भेजें', 'Envoyer Tâches', 'Пошаљи Задаци', 'إرسال المهام'),
(759, 'Study-Material', 'Study Material', 'Material de estudio', 'Material de estudo', 'अध्ययन सामग्री', 'Matériaux d''étude', 'Студи Материјали', 'دراسة المواد'),
(760, 'Homework', 'Homework', 'Tareas', 'tarefas', 'कार्यों', 'tâches', 'задаци', 'المهام'),
(763, 'Low', 'Low', 'Baja', 'cair', 'पड़ना', 'Petit', 'пасти', 'سقط'),
(764, 'Medium', 'Medium', 'Media', 'média', 'औसत', 'moyenne', 'просек', 'متوسط'),
(765, 'High', 'High', 'Alta', 'alto', 'उच्च', 'haut', 'висок', 'ارتفاع'),
(766, 'Why', 'Why report it?', '¿Por qué lo reporta?', 'Por que denunciá-lo?', 'यह रिपोर्ट क्यों?', 'Pourquoi le signaler?', 'Зашто се пријавити?', 'لماذا الإبلاغ عنه؟'),
(767, 'Sents', 'Sent', 'Enviados', 'enviados', 'दूत', 'envoyés', 'изасланици', 'المبعوثون'),
(768, 'My-Marks', 'My Marks', 'Mis calificaciones', 'As minhas notas', 'मेरा ग्रेड', '\nMes qualifications', 'Моје оцене', 'درجاتي'),
(770, 'My-Permissions', 'My Permissions', 'Mis Permisos', 'meus Permissão', 'मेरे अनुमतियां', 'Mes Autorisations', 'Моје Дозволе', 'بلدي ضوابط'),
(771, 'Create', 'Apply', 'Solicitar', 'pedido', 'प्रार्थना', 'Demander', 'захтев', 'طلب'),
(772, 'List-Perm', 'My permissions', 'Mis permisos', 'meus permissões', 'मेरे अनुमतियों', 'mes permissions', 'ми дозволе', 'أذونات بلدي'),
(822, 'News-Only', '', 'Noticias para profesores', 'Notícias para professores', 'शिक्षकों के लिए समाचार', 'Nouvelles pour les enseignants', 'Вести за наставнике', 'أخبار للمعلمين'),
(775, 'End_Date', 'Until', 'Hasta', 'para cima', 'ऊपर', 'en haut', 'горе', 'فوق'),
(776, 'Start_Date', 'From', 'Desde', 'de', 'से', 'Despuis', 'од', 'من'),
(779, 'Pending', 'Pending', 'Pendiente', 'pendente', 'अपूर्ण', 'en attendant', 'нерешен', 'ريثما'),
(778, 'Rejected', 'Rejected', 'Rechazada', 'rejeitados', 'गिरावट आई', 'diminué', 'опао', 'رفض'),
(821, 'Notice-Sent', 'News sent to teachers', 'Noticias enviadas a los profesores', 'Notícia enviada para professores', 'समाचार शिक्षकों को भेजा', 'Nouvelles envoyé aux enseignants', 'Новости послати наставнике', 'أرسلت الخبر إلى المعلمين'),
(780, 'My-Request', 'My applications', 'Mis solicitudes', 'minhas aplicações', 'मेरे अनुप्रयोगों', 'Mes applications', 'Моје пријаве', 'طلباتي'),
(823, 'Student-Bulk', 'Massive students', 'Estudiantes Masivos', 'estudantes maciças', 'बड़े पैमाने पर छात्रों', 'étudiants Massive', 'Массиве студенти', 'طلاب هائل'),
(872, 'Quick-ad', 'Send Quick Ads', 'Enviar Anuncios Rápidos', 'Enviar anúncios rápidos', 'भेजें त्वरित टॉप', 'Envoyer Annonces rapides', 'Сенд Брзи Огласи', 'إرسال إعلانات السريع'),
(873, 'Language', 'Language', 'Idioma', 'idioma', 'भाषा', 'Langue', 'језик', 'لغة'),
(790, 'Lists-Perms', 'Applications for permits', 'Solicitudes de permisos', 'Pedidos de licenças', 'परमिट के लिए आवेदन', 'Les demandes de permis', 'Захтев за издавање дозволе', 'طلبات الحصول على تصاريح'),
(796, 'Reject', 'Refuse', 'Rechazar', 'rejeitar', 'अस्वीकार', 'rejeter', 'одбити', 'رفض'),
(797, 'Accept', 'Accept', 'Aceptar', 'aceitar', 'स्वीकार करना', 'Accepter', 'прихватити', 'استعرض'),
(811, 'No_Options', 'No options', 'Sin opciones', 'não há opções', 'कोई विकल्प', 'Pas d''options', 'Но оптионс', 'لا توجد خيارات'),
(815, 'Nice', 'Approved', 'Aprobada', 'aprovado', 'अनुमोदित', 'approuvé', 'одобрен', 'وافق'),
(820, 'Teacher-News', 'Send news Professors only', 'Enviar noticia solo a Profesores', 'Enviar somente Professores de notícias', 'केवल समाचार प्रोफेसर भेजें', 'Envoyer uniquement les professeurs de presse', 'Послати само вести Професори', 'إرسال أساتذة الأخبار فقط'),
(838, 'add_a_row', 'Add more', 'Agregar más', 'Adicionar mais', 'जोड़े', 'Ajouter plus', 'Додај више', 'إضافة المزيد'),
(876, 'you-have-until', 'Youi have until', 'Tienes hasta', 'você tem até', 'आप जब तक है', 'vous avez jusqu''au', 'имате до', 'لديك حتى'),
(877, 'to-deliver-this-task', 'to deliver this task.', 'para entregar esta tarea', 'para entregar esta tarefa', 'इस कार्य को वितरित करने के लिए', 'pour fournir cette tâche', 'да испоручи овог задатка', 'لتقديم هذه المهمة'),
(878, 'Review-File', 'Your file will be sent for review.', 'Tu archivo será enviado para su revisión', 'Seu arquivo será enviado para revisão', 'आपकी फ़ाइल समीक्षा के लिए भेजा जाएगा', 'Votre dossier sera envoyé pour examen', 'Ваша датотека ће бити послат на преглед', 'سيتم إرسال ملف للمراجعة'),
(879, 'on-time', 'On time', 'A tiempo', 'A tempo', 'एक समय', 'À temps', 'vreme', 'زمن'),
(880, 'delayed', 'Delayed', 'Retrasada', 'atrasado', 'विलंबित', 'différé', 'одложен', 'مؤجل'),
(881, 'sent-for-review', 'Sent for review', 'Enviada para su revisión', 'Enviado para revisão', 'समीक्षा के लिए भेजा', 'Envoyés pour examen', 'Упућени на преглед', 'أرسلت للمراجعة'),
(882, 'deliver', 'Deliver', 'Entregar', 'entregar', 'उद्धार', 'livrer', 'доставити', 'نقل'),
(883, 'Last-day-delivery', 'Last day delivery', 'Último día de entrega', 'A entrega do último dia', 'अंतिम दिन वितरण', 'Livraison Dernier jour', 'Последњи дан испоруке', 'آخر يوم تسليم'),
(884, 'Files', 'Deliveries', 'Entregas', 'entregas', 'प्रसव', 'livraisons', 'испоруке', 'التسليم'),
(885, 'Homework-Sent', 'Sent', 'Enviadas', 'você enviou', 'आप भेजा', 'Vous avez envoyé', 'сте послали', 'قمت بإرسالها'),
(2176, 'Payments', 'Create Payment', 'Crear nuevo pago', 'Criar novo pagamento', 'नई भुगतान बनाएं', 'Créer un nouveau paiement', 'Створити нову уплату', 'خلق دفعة جديدة'),
(2098, 'Average', 'Average', 'Promedio ', 'média', 'औसत', 'moyenne', 'просек', 'متوسط'),
(2080, 'Generate', 'Generate Sheet', 'Generar cuadros', 'gerar imagens', 'चित्रों उत्पन्न', 'générer des images', 'генерисање слике', 'توليد الصور'),
(2074, 'Tabulation', 'Tabulation Sheet', 'Cuadros', 'imagens', 'चित्रों', 'photos', 'слике', 'الصور'),
(2073, 'Comments', 'Comment', 'Comentario', 'comentário', 'टिप्पणी', 'commentaire', 'коментар', 'تعليق'),
(2071, 'Sections', 'Sections', 'Secciones', 'seções', 'वर्गों', 'sections', 'профили', 'الأقسام'),
(1904, 'Discussion', 'Discussions', 'Discusiones  ', 'discussões', 'विचार-विमर्श', 'discussions', 'дискусије', 'مناقشات'),
(2068, 'FinalExam', 'Exam', 'Examen', 'exame', 'परीक्षा', 'exam', 'испит', 'امتحان'),
(2066, 'Update-Information', 'Update Profile', 'Actualizar perfil', 'atualizar', 'अद्यतन', 'mettre à jour', 'ажурирање', 'تحديث'),
(2065, 'No', 'No', 'No', 'não', 'नहीं', 'pas', 'не', 'ليس'),
(2064, 'Yes', 'Yes', 'Si', 'se', 'यदि', 'si', 'ако', 'إذا'),
(2063, 'This-Month', 'This month is her birthday', 'Este mes es su cumpleaños', 'Este mês é seu aniversário', 'इस महीने अपने जन्मदिन है', 'Ce mois-ci est votre anniversaire', 'Овог месеца је ваш рођендан', 'هذا الشهر هو عيد ميلادك'),
(2059, 'Class-Assigned', 'Assigned Class', 'Salón Asignado', 'alocados Salão', 'आवंटित हॉल', 'Numéroté Salle', 'издвојила сала', 'قاعة المخصصة'),
(2060, 'Excellent', '\nExcellent Student', 'Alumno Excelente', 'excelente aluno', 'उत्कृष्ट छात्र', 'Excellente élève', 'одличан ученик', 'طالب ممتاز'),
(2026, 'Academic-Settings', 'Academic Settings', 'Ajustes Académicos', 'ambientes acadêmicos', 'शैक्षिक सेटिंग्स', 'paramètres académiques', 'Ацадемиц подешавања', 'إعدادات الأكاديمية'),
(2016, 'Type', 'Type', 'Tipo', 'tipo', 'टाइप', 'Type', 'тип', 'نوع'),
(2017, 'From', 'From', 'Desde', 'de', 'से', 'Despuis', 'од', 'من'),
(2018, 'To', 'To', 'Hasta', 'para cima', 'ऊपर', 'en haut', 'горе', 'فوق'),
(2062, 'Last-News', 'Last News', 'Noticias recientes', 'Notícias recentes', 'हाल ही में खबर', 'Nouvelles récentes', 'nedavno Новости', 'الأخبار الأخيرة'),
(2019, 'Main', 'Navigation', 'Menu', 'menu', 'मेन्यू', 'menu', 'мени', 'قائمة الطعام'),
(2021, 'Students-Information', 'Information', 'Información', 'informação', 'सूचना', 'information', 'информације', 'معلومات'),
(2022, 'Users-Account', 'Users', 'Usuarios', 'usuários', 'उपयोगकर्ताओं', 'utilisateurs', '\nкорисници', 'المستخدمين'),
(2023, 'ManageClassrooms', 'Classrooms', 'Salones de Clase', 'Salas de aula', 'कक्षाओं', 'Les salles de classe', 'učionice', 'الفصول الدراسية');
INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `spanish`, `portuguse`, `hindi`, `french`, `serbian`, `arabic`) VALUES
(2024, 'SemesterContent', 'Contents', 'Contenidos', 'conteúdo', 'अंतर्वस्तु', 'contenu', 'садржај', 'محتويات'),
(2025, 'Settings', 'Settings', 'Ajustes', 'configurações', 'सेटिंग्स', 'réglages', 'podešavanja', 'إعدادات'),
(2027, 'Library', 'Library', 'Librería', 'livraria', 'किताबों की दुकान', 'librairie', 'књижара', 'مكتبة'),
(2028, 'StudentsReports', 'Students Reports', 'Estudiantes', 'estudantes', 'छात्रों', 'étudiants', 'студенти', 'الطلاب'),
(2029, 'TeacherReports', 'Teachers Reports', 'Profesores', 'professores', 'शिक्षकों', 'enseignants', 'наставници', 'معلمون'),
(2030, 'SchoolReports', 'School Reports', 'Reportes Escolares', 'relatórios escolares', 'स्कूल की रिपोर्ट', 'les bulletins scolaires', 'Школски извештаји', 'التقارير المدرسية'),
(2031, 'TeachersFiles', 'Teachers Files', 'Archivos Profesores', 'arquivos de professores', 'शिक्षक फ़ाइलें', 'fichiers enseignants', 'Наставници фајлова', 'ملفات المعلمين'),
(2032, 'ListsPerms', 'Permissions', 'Permisos', 'permissões', 'अनुमतियों', 'autorisations', 'дозволе', 'أذونات'),
(2033, 'StaticPages', 'Statics Pages', 'Páginas estáticas', 'páginas estáticas', 'स्थैतिक पृष्ठों', 'pages statiques', 'статичке странице', 'صفحات ثابتة'),
(2034, 'ManagePages', 'Manage Pages', 'Administrar Páginas', 'gerenciar páginas', 'पेज का प्रबंधन', 'gérer Pages', 'управљати Пагес', 'إدارة الصفحات'),
(2035, 'NewPage', 'New Page', 'Agregar nueva', 'Adicionar nova', 'नए जोड़े', 'Ajouter un nouveau', 'Додај нови', 'إضافة جديدة'),
(2036, 'Pages', 'Pages', 'Páginas', 'páginas', 'पृष्ठों', 'pages', 'страница', 'الصفحات'),
(2037, 'PersonalInfo', 'Personal Information', 'Información Personal', 'Informação pessoal', 'व्यक्तिगत जानकारी', 'Information personnelle', 'Лични подаци', 'المعلومات الشخصية'),
(2038, 'UpdateProfile', 'Update Information', 'Actualizar Información', 'actualização da informação', 'जानकारी अद्यतन करें', 'mise à jour de l''information', 'informacije ажурирање', 'تحديث المعلومات'),
(2039, 'Picture', 'Photo', 'Fotografía', 'fotografia', 'फोटोग्राफी', 'photographie', 'фотографија', 'تصوير'),
(2058, 'Registered', 'Registered Since', 'Registrado desde', 'registrado desde', 'के बाद से पंजीकृत', 'enregistré depuis', 'регистрован од', 'مسجل منذ'),
(2057, 'Student-Portal', 'Student Portal', 'Portal de Estudiantes', 'Portal do aluno', 'छात्र पोर्टल', 'Portail étudiant', 'студент портал', 'بوابة الطالب'),
(2056, 'Add-Student', 'Add Student', 'Agregar Estudiante', 'Adicionar Student', 'छात्र जोड़े', 'Ajouter étudiant', 'Додај Студент', 'إضافة طالب'),
(2240, 'Single', 'Single Payment', 'Pago único', 'de pagamento único', 'एकल भुगतान', 'paiement unique', 'једнократно', 'دفعة واحدة'),
(2305, 'Invoice', 'Invoice Details', 'Detalles de la Factura', 'Detalhes da fatura', 'चालान विवरण', 'Détails facture', 'Детаљи рачуна', 'تفاصيل الفاتورة'),
(2338, 'PaymentInfo', 'Payment Information', 'Información del pago', 'Informação de pagamento', 'भुगतान जानकारी', 'Conditions de vente', 'informacije о плаћању', 'معلومات الدفع'),
(2356, 'Payment', 'Payment', 'Cantidad', 'quantidade', 'मात्रा', 'quantité', 'количина', 'كمية'),
(2357, 'PaymentAmount', 'Payment Amount', 'Cantidad del pago', 'Valor do pagamento', 'भुगतान राशि', 'Montant du paiement', 'Износ за плаћање', 'دفع المبلغ'),
(2525, 'Student-Payment', 'Student Payment', 'Pagos de estudiantes', 'Pagamentos estudantes', 'भुगतान के छात्रों', 'Étudiants Paiements', 'Исплате студенти', 'دفعات الطلبة'),
(2526, 'Payment', 'Payment', 'Cantidad', 'pagamento', 'मात्रा', 'quantité', 'количина', 'كمية'),
(2527, 'Paid', 'Paid', 'Pagado', 'pago', 'भुगतान', 'payé', 'плаћен', 'مدفوع'),
(2528, 'Unpaid', 'Unpaid', 'Sin pagar', 'sem pagar', 'भुगतान के बिना', 'Sans payer', 'без плаћања', 'دون دفع'),
(2652, 'StudentPayment', 'Student Payment', 'Pagos de estudiantes', 'Pagamentos estudantes', 'भुगतान के छात्रों', 'Étudiants Paiements', 'Исплате студенти', 'دفعات الطلبة'),
(2653, 'invoices', 'Invoices', 'Facturas', 'facturas', 'चालान', 'factures', 'фактуре', 'الفواتير'),
(2654, 'payment_history', 'Payment History', 'Historial de pagos', 'Histórico de pagamentos', 'भुगतान इतिहास', 'Historique des paiements', 'Историја плаћање', 'تاريخ الدفع'),
(3588, 'Paypal-Email', 'PayPal Email', 'Correo PayPal', 'E PayPal', 'ई पेपैल', 'E PayPal', 'Е ПаиПал', 'E باي بال'),
(3595, 'Price', 'Price', 'Precio', 'preço', 'कीमत', 'prix', 'цена', 'السعر'),
(3607, 'Price', 'Price', 'Precio', 'preço', 'कीमत', 'prix', 'цена', 'السعر'),
(3609, 'Price', 'Price', 'Precio', 'preço', 'कीमत', 'prix', 'цена', 'السعر'),
(3644, 'MarksLimit', 'Date limit to upload marks', 'Fecha límite para subir calificaciones', 'Prazo para carregar pontuações', 'स्कोर को अपलोड करने की समय सीमा', 'Date limite pour télécharger les partitions', 'Рок за отпремање резултате', 'الموعد النهائي لتحميل عشرات'),
(3645, 'Rating', 'Allow students to report to teachers?', '¿Permitir reportes para profesores?', 'Permitir relatórios para os professores?', 'शिक्षकों के लिए रिपोर्ट की अनुमति दें?', 'Autoriser les rapports pour les enseignants?', 'Дозволите извештаје за наставнике?', 'السماح تقارير للمعلمين؟'),
(3646, 'MiniMark', 'Minimum mark to pass a course', 'Nota mínima para aprobar un curso', 'nota mínima para passar por um curso', 'न्यूनतम ग्रेड एक कोर्स पास करने के लिए', 'note minimale de passer un cours', 'минимална оцена да прође курс', 'الحد الأدنى درجة لتمرير دورة'),
(3647, 'AverageMin', 'Minimum average for outstanding student', 'Promedio mínimo para estudiante destacado', 'estudante excepcional média mínima', 'न्यूनतम औसत बकाया छात्र', 'étudiant exceptionnel en moyenne minimum', 'Минимални просечни изузетан ученик', 'متوسط الحد الأدنى الطالب المتميز'),
(3648, 'TeacherAverage', 'Allow teachers to check the tabulation?', '¿Permitir a los profesores consultar los cuadros?', 'Permitir aos professores para ver as fotos?', 'शिक्षकों तस्वीरें देखने के लिए अनुमति दें?', 'Permettre aux enseignants de voir les images?', 'Омогуће наставницима да видимо слике?', 'تمكين المدرسين من رؤية الصور؟'),
(3653, 'ClassForum', 'Class Forum', 'Foro de clases', 'Fórum classe', 'कक्षा फोरम', 'classe Forum', 'цласс форум', 'المنتدى الدرجة'),
(3654, 'CreatePost', 'Create Post', 'Publicar', 'publicar', 'प्रकाशित करना', 'publier', 'објавити', 'نشر'),
(3686, 'Parents-Dashboard', 'Parents Dashboard', 'Tablero de padres', 'Os pais Board', 'माता-पिता को बोर्ड', 'Conseil parents', 'roditelji одбор', 'مجلس أولياء الأمور'),
(3699, 'Students-Dashboard', 'Student Dashboard', 'Tablero de Estudiante', 'Placa de estudante', 'छात्र बोर्ड', 'Conseil étudiant', 'студент одбор', 'مجلس الطلبة'),
(3894, 'Print', 'Print', 'Imprimir', 'impressão', 'छाप', 'imprimer', 'штампа', 'طباعة'),
(3865, 'Gallery', 'Media Gallery', 'Multimedia', 'multimídia', 'मल्टीमीडिया', 'multimédia', 'мултимедијални', 'الوسائط المتعددة'),
(3866, 'GalleryCat', 'Gallery Category', 'Categorías', 'Categorias', 'श्रेणियाँ', 'Catégories', 'Категорије', 'الفئات'),
(3867, 'GalleryPic', 'Gallery', 'Galería', 'galeria', 'गैलरी', 'galerie', 'галерија', 'رواق'),
(3868, 'VideoGallery', 'Video Gallery', 'Videos', 'vídeos', 'वीडियो', 'Vidéos', 'Видео', 'فيديو'),
(3889, 'Unavailab', 'Unavailable', 'No disponible', 'Não disponível', 'उपलब्ध नहीं', 'Non disponible', 'није доступно', 'غير متوفرة'),
(3871, 'embedid', 'URL embed', 'URL embed', 'URL embed', 'ट्वीट यूआरएल', 'URL d''intégration', 'УРЛ за уграђивање', 'URL ضمن'),
(3872, 'Skin', 'Skin Colour', 'Estilo', 'estilo', 'शैली', 'style', 'стил', 'أسلوب'),
(3873, 'White', 'White', 'Blanco', 'branco', '\nसफेद', 'Blanc', 'бео', 'أبيض'),
(3874, 'Upload-Video', 'Add Video', 'Agregar Video', 'Adicionar vídeo', 'वीडियो जोड़ें', 'Ajouter la vidéo', 'Адд Видео', 'إضافة فيديو'),
(3886, 'Availab', 'Available', 'Disponible', 'disponível', 'उपलब्ध', 'disponible', 'доступан', 'متاح'),
(3883, 'Author', 'Author', 'Autor', 'autor', 'लेखक', 'auteur', 'аутор', 'مؤلف'),
(3930, 'TeacherRequest', 'Teacher Permits', 'Permisos de Profesores', 'professores licenças', 'शिक्षक परमिट', 'enseignants permis', 'Наставници дозволе', 'تصاريح المعلمين'),
(3931, 'StudentRequest', 'Student Permits', 'Permisos de Estudiantes', 'Visto de estudante', 'छात्र परमिट', 'Le permis d''études', 'Студент дозволе', 'تصاريح طالب'),
(3932, 'Late', 'I''m late', 'Llegó tarde', 'Estou atrasado', 'यह देर हो चुकी थी', 'Je suis en retard', 'Било је касно', 'أنا في وقت متأخر'),
(3933, 'Allowed', 'Allow to change marks more than twice?', '¿Permitir cambiar calificaciones más de dos veces?', NULL, NULL, NULL, NULL, 'السماح عشرات تغير أكثر من مرتين؟');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libreria`
--

CREATE TABLE IF NOT EXISTS `libreria` (
  `libro_id` int(11) NOT NULL AUTO_INCREMENT,
  `libro_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `uploader_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `year` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `nombre` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `autor` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`libro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mark`
--

CREATE TABLE IF NOT EXISTS `mark` (
  `mark_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mark_obtained` int(11) NOT NULL DEFAULT '0',
  `mark_total` int(11) NOT NULL DEFAULT '100',
  `comment` longtext COLLATE utf8_unicode_ci,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `labuno` int(11) NOT NULL DEFAULT '0',
  `labdos` int(11) NOT NULL DEFAULT '0',
  `labtres` int(11) NOT NULL DEFAULT '0',
  `labcuatro` int(11) NOT NULL DEFAULT '0',
  `labcinco` int(11) NOT NULL DEFAULT '0',
  `labseis` int(11) NOT NULL DEFAULT '0',
  `labsiete` int(11) NOT NULL DEFAULT '0',
  `labocho` int(11) NOT NULL DEFAULT '0',
  `labnueve` int(11) NOT NULL DEFAULT '0',
  `labtotal` int(11) NOT NULL DEFAULT '0',
  `final` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mark_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=261 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje_reporte`
--

CREATE TABLE IF NOT EXISTS `mensaje_reporte` (
  `news_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `news_id` int(11) NOT NULL,
  `date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`news_message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext NOT NULL,
  `message` longtext NOT NULL,
  `sender` longtext NOT NULL,
  `timestamp` longtext NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 unread 1 read',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_thread`
--

CREATE TABLE IF NOT EXISTS `message_thread` (
  `message_thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reciever` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_message_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`message_thread_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `news_status` int(11) NOT NULL DEFAULT '1' COMMENT '1 for running, 0 for archived',
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=44 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news_teacher`
--

CREATE TABLE IF NOT EXISTS `news_teacher` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `notice_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notice_message`
--

CREATE TABLE IF NOT EXISTS `notice_message` (
  `notice_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `notice_id` int(11) NOT NULL,
  `date` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_file_name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`notice_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parent`
--

CREATE TABLE IF NOT EXISTS `parent` (
  `parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profession` longtext COLLATE utf8_unicode_ci NOT NULL,
  `username` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poa`
--

CREATE TABLE IF NOT EXISTS `poa` (
  `id_poa` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre_archivo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tipo_archivo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_poa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `question` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `optiona` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `optionb` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `optionc` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `optiond` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correctanswer` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `marks` int(11) NOT NULL,
  `exam_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_alumnos`
--

CREATE TABLE IF NOT EXISTS `reporte_alumnos` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `report_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `priority` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_mensaje`
--

CREATE TABLE IF NOT EXISTS `reporte_mensaje` (
  `report_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sender_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`report_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `start_date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `end_date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = pending, 1 = accepted, 2 = rejected',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', 'EduAppGT'),
(2, 'system_title', 'School Management System'),
(3, 'address', 'Johannesburg'),
(4, 'phone', '(+502) 7777 6666'),
(5, 'paypal_email', 'payments@demo.com'),
(6, 'currency', 'R'),
(7, 'system_email', 'contact@mpages.co'),
(20, 'rtl', 'rtl'),
(11, 'language', 'english'),
(13, 'minimark', '50'),
(15, 'ad', 'This message is demo for EduAppGT V3. Thank you for consulting the demo online! You can change this message in System Settings.'),
(16, 'skin_colour', 'blue'),
(18, 'domain', 'google.com'),
(21, 'running_year', '2016-2017'),
(22, 'facebook_url', 'https://www.facebook.com/'),
(23, 'twitter_url', 'https://www.twitter.com/'),
(24, 'google_url', 'https://www.google.com/'),
(25, 'instagram_url', 'https://instagram.com/'),
(26, 'linkedin_url', 'https://www.linkedin.com/'),
(27, 'pinterest_url', 'https://pinterest.com/'),
(28, 'dribbble_url', 'https://dribbble.com/'),
(29, 'youtube_url', 'https://youtube.com/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birthday` longtext COLLATE utf8_unicode_ci,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `dormitory_id` int(11) DEFAULT NULL,
  `transport_id` int(11) DEFAULT NULL,
  `student_session` int(11) NOT NULL DEFAULT '1',
  `username` longtext COLLATE utf8_unicode_ci NOT NULL,
  `aditional_subjects_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `board` int(11) NOT NULL DEFAULT '0',
  `student_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students_request`
--

CREATE TABLE IF NOT EXISTS `students_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `start_date` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `end_date` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student_exam`
--

CREATE TABLE IF NOT EXISTS `student_exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `correctlyanswered` int(11) NOT NULL DEFAULT '0',
  `status` enum('completed','inprogress') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `la1` longtext COLLATE utf8_unicode_ci,
  `la2` longtext COLLATE utf8_unicode_ci,
  `la3` longtext COLLATE utf8_unicode_ci,
  `la4` longtext COLLATE utf8_unicode_ci,
  `la5` longtext COLLATE utf8_unicode_ci,
  `la6` longtext COLLATE utf8_unicode_ci,
  `la7` longtext COLLATE utf8_unicode_ci,
  `la8` longtext COLLATE utf8_unicode_ci,
  `la9` longtext COLLATE utf8_unicode_ci,
  `la10` longtext CHARACTER SET utf16 COLLATE utf16_unicode_ci,
  `final` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birthday` longtext COLLATE utf8_unicode_ci,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `salary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `username` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ticket_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'opened closed',
  `priority` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'baja media alta',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  `assigned_staff_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_message`
--

CREATE TABLE IF NOT EXISTS `ticket_message` (
  `ticket_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ticket_message_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transport`
--

CREATE TABLE IF NOT EXISTS `transport` (
  `transport_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `number_of_vehicle` longtext COLLATE utf8_unicode_ci NOT NULL,
  `route_fare` longtext COLLATE utf8_unicode_ci NOT NULL,
  `driver_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `driver_phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`transport_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
