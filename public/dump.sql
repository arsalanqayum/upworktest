
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `card_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `card_models_column_id_foreign` (`column_id`),
  CONSTRAINT `card_models_column_id_foreign` FOREIGN KEY (`column_id`) REFERENCES `column_models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `card_models` WRITE;
/*!40000 ALTER TABLE `card_models` DISABLE KEYS */;
INSERT INTO `card_models` VALUES (1,'Quod hic aut commodi est aliquid illo alias asperiores.','Voluptas similique deleniti accusantium in. Sint nihil fuga non omnis sunt fugit. Modi sit enim eius explicabo. Ut id ex quia ipsam aspernatur.',3,'2021-07-21 10:39:48','2021-07-21 13:33:57'),(2,'Occaecati sunt amet distinctio molestiae repellat provident.','Optio voluptatum itaque rem consequatur. Illo voluptas sunt doloremque ut corporis maiores mollitia. Sit corporis nihil voluptatem ea aliquid excepturi rem. Ipsam reprehenderit nihil tempora delectus tenetur.',1,'2021-07-21 10:39:48','2021-07-21 10:39:48'),(3,'Aut numquam quisquam eos culpa sequi excepturi.','Incidunt qui omnis omnis velit qui. Velit voluptatum quis ut cum et occaecati. Et et aut sit esse quasi ut.',1,'2021-07-21 10:39:48','2021-07-21 10:39:48'),(4,'Provident facere at quisquam omnis officia eligendi quis.','At ut quis quibusdam est voluptas. Voluptas excepturi itaque repellat cumque ducimus ipsa. Minus est iusto omnis molestias et dolorum ut.',1,'2021-07-21 10:39:48','2021-07-21 10:39:48'),(7,'Officiis maxime et dignissimos vitae.','Quo pariatur totam dolorum ex. Facilis dicta officiis voluptatem eaque quaerat nobis enim.',1,'2021-07-21 10:39:48','2021-07-21 12:59:15'),(8,'Consequatur sint aut repellat eligendi.','Eum assumenda vero enim qui occaecati. Quia praesentium in aperiam aut voluptatem a. Quia magni quia magni fugit sit molestiae inventore.',1,'2021-07-21 10:39:48','2021-07-21 12:59:17'),(10,'Voluptate sequi aliquam incidunt sint nam voluptatum velit.','Voluptatem soluta dolorum velit velit corporis nisi nostrum dolorem. Dolor qui tenetur sint ea autem blanditiis.',1,'2021-07-21 10:39:48','2021-07-21 12:59:22'),(12,'Modi atque maiores quia placeat.','Sapiente eos non voluptas eveniet aliquam occaecati cum. Quia autem ipsa consequatur quam consectetur quia. Ducimus dolor voluptatem sint vel dolores.',1,'2021-07-21 10:39:48','2021-07-21 12:59:24'),(13,'Eum totam officiis voluptas quo molestiae dolores.','Consequatur maxime nihil eos voluptatibus. Ut quis aut odit est rem tempore ut. Consequatur sit quasi vel facere eaque eos sint. Beatae ab harum rerum sit.',2,'2021-07-21 10:39:48','2021-07-21 13:10:54'),(14,'Excepturi maxime nam omnis possimus doloribus accusamus.','Ut nihil nesciunt rerum. Adipisci eius voluptatem ea aut. Corrupti quis aliquam vitae eveniet id. Qui autem sit veniam commodi.',1,'2021-07-21 10:39:48','2021-07-21 13:04:05'),(16,'Vitae est ut quia quibusdam reiciendis alias id ab.','Aut non neque voluptas minima. Porro provident dolores voluptates consequuntur accusamus. Et repudiandae vitae aperiam modi dolorem consequatur. Mollitia voluptatem rerum nostrum quis iste ut voluptatibus. Provident dolores sed et nihil.',1,'2021-07-21 10:39:49','2021-07-21 13:04:08'),(18,'Qui vero similique sit temporibus cumque.','Laboriosam vero itaque id necessitatibus officia totam provident aliquid. Qui a ex mollitia rem aut. Hic omnis quod velit perspiciatis sed similique.',1,'2021-07-21 10:39:49','2021-07-21 13:04:10'),(19,'Corporis odit aut qui mollitia rerum nemo.','Tenetur rerum ut qui omnis asperiores nulla. Est hic ipsam hic qui cupiditate. Nostrum delectus ex voluptatibus non quis laboriosam dolores. Iste dolorem odit quidem itaque quidem.',2,'2021-07-21 10:39:49','2021-07-21 13:33:49'),(20,'Ut quasi esse maiores vel temporibus autem dolorem.','Illum ex dolorum ullam et omnis debitis. Dolores exercitationem nisi ipsum velit expedita. Assumenda pariatur quaerat odit repudiandae non facilis. Exercitationem ut doloribus maxime magnam dolorem.',4,'2021-07-21 10:39:49','2021-07-21 13:03:54'),(21,'Vero veritatis similique eos nobis voluptatum.','Aut voluptatem praesentium autem et et. Quis enim laboriosam culpa eligendi. Sapiente magni qui asperiores aspernatur possimus quasi et. Amet voluptas natus modi omnis.',4,'2021-07-21 10:39:49','2021-07-21 13:03:58'),(22,'Ab quam ipsum at voluptatibus.','Quis aperiam voluptas sed velit dolores alias. Qui a corrupti harum aperiam sit in. Sed fugiat nobis cupiditate quod molestias. Aspernatur illo dolores molestiae qui.',4,'2021-07-21 10:39:49','2021-07-21 13:03:56'),(25,'jksadlskajd salkdjklsa','laskdjsalk',1,'2021-07-21 13:35:28','2021-07-21 13:35:28');
/*!40000 ALTER TABLE `card_models` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `column_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `column_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `column_models` WRITE;
/*!40000 ALTER TABLE `column_models` DISABLE KEYS */;
INSERT INTO `column_models` VALUES (1,'Pick for development','2021-07-21 10:39:48','2021-07-21 10:39:48'),(2,'Pick for development','2021-07-21 10:39:48','2021-07-21 10:39:48'),(3,'In review','2021-07-21 10:39:48','2021-07-21 10:39:48'),(4,'In review','2021-07-21 10:39:48','2021-07-21 10:39:48'),(5,'test','2021-07-21 13:32:25','2021-07-21 13:32:25'),(6,'sdkjfdskj dskjf','2021-07-21 13:32:41','2021-07-21 13:32:41');
/*!40000 ALTER TABLE `column_models` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2021_07_20_201103_create_column_models_table',1),(2,'2021_07_20_201406_create_card_models_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

