/*
 Navicat Premium Data Transfer

 Source Server         : codepe
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : tramite_peru

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 20/11/2022 16:38:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `area_cod` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo auto-incrementado del movimiento del area',
  `area_nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre del area',
  `area_fecha_registro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) COMMENT 'fecha del registro del movimiento',
  `area_estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'ACTIVO' COMMENT 'estado del area',
  PRIMARY KEY (`area_cod`) USING BTREE,
  UNIQUE INDEX `unico`(`area_nombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci COMMENT = 'Entidad Area' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, 'ADMINISTRACION', '2022-11-18 17:38:55', 'ACTIVO');
INSERT INTO `area` VALUES (4, 'AREA UNO', '2022-11-18 17:51:16', 'ACTIVO');
INSERT INTO `area` VALUES (5, 'AREA DOS', '2022-11-18 17:51:30', 'ACTIVO');
INSERT INTO `area` VALUES (6, 'AREA TRES', '2022-11-18 17:51:43', 'ACTIVO');
INSERT INTO `area` VALUES (7, 'AREA CUATRO', '2022-11-18 17:51:52', 'ACTIVO');

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente`  (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo auto-incrementado del movimiento del cliente',
  `cli_nro_ruc` char(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre del cliente',
  `cli_razon_social` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL COMMENT 'razon social',
  `cli_direccion` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL COMMENT 'direccion del cliente',
  `cli_celular` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'celular del cliente',
  `cli_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `cli_fecha_registro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) COMMENT 'fecha del registro del cliente',
  `cli_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'ACTIVO' COMMENT 'estado del cliente',
  PRIMARY KEY (`cliente_id`) USING BTREE,
  UNIQUE INDEX `unico`(`cli_razon_social`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci COMMENT = 'Entidad Area' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES (7, '10789765291', 'CLIENTE UNO', 'DIRECCION UNO LIMA CERCADO', '999888777', 'CLIENTE@UNO.PE', '2022-11-18 17:50:21', 'ACTIVO');
INSERT INTO `cliente` VALUES (8, '20894628491', 'CLIENTE DOS', 'DIRECCION DOS LIMA CERCADO', '999666777', 'CLIENTE@DOS.PE', '2022-11-18 17:50:49', 'ACTIVO');

-- ----------------------------
-- Table structure for detalle_documento
-- ----------------------------
DROP TABLE IF EXISTS `detalle_documento`;
CREATE TABLE `detalle_documento`  (
  `detadocu_id` int(11) NOT NULL AUTO_INCREMENT,
  `documento_id` char(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `producto_id` int(255) NULL DEFAULT NULL,
  `detadocu_cantidad` int(255) NULL DEFAULT NULL,
  `detadocu_precio` decimal(10, 2) NULL DEFAULT NULL,
  `detadocu_subtotal` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`detadocu_id`) USING BTREE,
  INDEX `documento_id`(`documento_id`) USING BTREE,
  INDEX `producto_id`(`producto_id`) USING BTREE,
  CONSTRAINT `detalle_documento_ibfk_1` FOREIGN KEY (`documento_id`) REFERENCES `documento` (`documento_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detalle_documento_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalle_documento
-- ----------------------------
INSERT INTO `detalle_documento` VALUES (1, 'D0000001', 10, 3, 4.00, 12.00);
INSERT INTO `detalle_documento` VALUES (2, 'D0000001', 8, 12, 3.00, 36.00);
INSERT INTO `detalle_documento` VALUES (3, 'D0000002', 10, 2, 3.00, 6.00);
INSERT INTO `detalle_documento` VALUES (4, 'D0000002', 9, 2, 3.00, 6.00);

-- ----------------------------
-- Table structure for documento
-- ----------------------------
DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento`  (
  `documento_id` char(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_archivo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_fecharegistro` datetime(0) NULL DEFAULT current_timestamp(0),
  `area_id` int(11) NULL DEFAULT 1,
  `doc_estatus` enum('PENDIENTE','RECHAZADO','FINALIZADO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `area_origen` int(11) NOT NULL DEFAULT 0,
  `area_destino` int(11) NULL DEFAULT NULL,
  `cliente_id` int(11) NULL DEFAULT NULL,
  `documento_total` decimal(10, 2) NULL DEFAULT NULL,
  `usuario_id` int(11) NULL DEFAULT NULL,
  `doc_asunto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`documento_id`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `area_origen`(`area_origen`) USING BTREE,
  INDEX `area_destino`(`area_destino`) USING BTREE,
  INDEX `cliente_id`(`cliente_id`) USING BTREE,
  INDEX `usuario_id`(`usuario_id`) USING BTREE,
  CONSTRAINT `0` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `documento_ibfk_3` FOREIGN KEY (`area_origen`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `documento_ibfk_4` FOREIGN KEY (`area_destino`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `documento_ibfk_5` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `documento_ibfk_6` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of documento
-- ----------------------------
INSERT INTO `documento` VALUES ('D0000001', 'controller/tramite/documentos/ARCH1911202211607.PDF', '2022-11-19 11:54:44', 7, 'PENDIENTE', 1, 7, 7, 48.00, 36, 'SADASD');
INSERT INTO `documento` VALUES ('D0000002', 'controller/tramite/documentos/ARCH2011202216962.PDF', '2022-11-20 16:31:34', 5, 'PENDIENTE', 1, 5, 7, 12.00, 36, '&LT;ZXZ');

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado`  (
  `empleado_id` int(11) NOT NULL AUTO_INCREMENT,
  `emple_nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_apepat` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_apemat` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_feccreacion` date NULL DEFAULT NULL,
  `emple_fechanacimiento` date NULL DEFAULT NULL,
  `emple_nrodocumento` char(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_movil` char(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emple_direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_telefono` char(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `empl_fotoperfil` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`empleado_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES (21, 'EMPLEADO', 'UNO', 'UNO', '2022-11-18', '1992-11-07', '54987265', '999206021', 'DANIEL@CASTRO.COM', 'ACTIVO', 'AV PERU 345 LIMA CERCADO', '5497827', NULL);
INSERT INTO `empleado` VALUES (22, 'EMPLEADO', 'DOS', 'DOS', '2022-11-18', '1994-08-15', '78102347', '982047295', 'EMPLEADO@DOS.PE', 'ACTIVO', 'DIRECCION DOS LIMA CERCADO', NULL, 'controller/empleado/FOTOS/admin.png');

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa`  (
  `empresa_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_razon` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_cod` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_direccion` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`empresa_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES (3, 'LOCAL ARGENTINA', 'LOCAL@ARGENTINA.COM', '', '936789254', 'AV ARGENTINA 983 LIMA CERCADO', '');

-- ----------------------------
-- Table structure for movimiento
-- ----------------------------
DROP TABLE IF EXISTS `movimiento`;
CREATE TABLE `movimiento`  (
  `movimiento_id` int(11) NOT NULL AUTO_INCREMENT,
  `documento_id` char(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `area_origen_id` int(11) NULL DEFAULT NULL,
  `areadestino_id` int(11) NOT NULL,
  `mov_fecharegistro` datetime(0) NULL DEFAULT current_timestamp(0),
  `mov_descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mov_estatus` enum('PENDIENTE','CONFORME','INCOFORME','ACEPTADO','DERIVADO','FINALIZADO','RECHAZADO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `usuario_id` int(11) NULL DEFAULT NULL,
  `mov_archivo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `mov_descripcion_original` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`movimiento_id`) USING BTREE,
  INDEX `area_origen_id`(`area_origen_id`) USING BTREE,
  INDEX `areadestino_id`(`areadestino_id`) USING BTREE,
  INDEX `usuario_id`(`usuario_id`) USING BTREE,
  INDEX `documento_id`(`documento_id`) USING BTREE,
  CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`area_origen_id`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`areadestino_id`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `movimiento_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `movimiento_ibfk_4` FOREIGN KEY (`documento_id`) REFERENCES `documento` (`documento_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movimiento
-- ----------------------------
INSERT INTO `movimiento` VALUES (1, 'D0000001', 1, 7, '2022-11-19 11:54:44', 'SADASD', 'PENDIENTE', 36, 'controller/tramite/documentos/ARCH1911202211607.PDF', NULL);
INSERT INTO `movimiento` VALUES (2, 'D0000002', 1, 5, '2022-11-20 16:31:35', '&LT;ZXZ', 'PENDIENTE', 36, 'controller/tramite/documentos/ARCH2011202216962.PDF', NULL);

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo auto-incrementado del movimiento del producto',
  `producto_nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre del producto',
  `producto_fecha_registro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) COMMENT 'fecha del registro del producto',
  `producto_estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'ACTIVO' COMMENT 'estado del producto',
  PRIMARY KEY (`producto_id`) USING BTREE,
  UNIQUE INDEX `unico`(`producto_nombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci COMMENT = 'Entidad Area' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (7, 'PRODUCTO UNO', '2022-11-18 17:49:26', 'ACTIVO');
INSERT INTO `producto` VALUES (8, 'PRODUCTO DOS', '2022-11-18 17:49:32', 'ACTIVO');
INSERT INTO `producto` VALUES (9, 'PRODUCTO TRES', '2022-11-18 17:49:38', 'ACTIVO');
INSERT INTO `producto` VALUES (10, 'PRODUCTO CUATRO', '2022-11-18 17:49:45', 'ACTIVO');

-- ----------------------------
-- Table structure for tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento`  (
  `tipodocumento_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo auto-incrementado del tipo documento',
  `tipodo_descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcion del  tipo documento',
  `tipodo_estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'estado del tipo de documento',
  `tipodo_fregistro` datetime(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`tipodocumento_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci COMMENT = 'Entidad Documento' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipo_documento
-- ----------------------------
INSERT INTO `tipo_documento` VALUES (7, 'NOTA DE VENTA', 'ACTIVO', '2022-11-18 17:51:03');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `usu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_usuario` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT '',
  `usu_contra` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `usu_feccreacion` date NULL DEFAULT NULL,
  `usu_fecupdate` date NULL DEFAULT NULL,
  `empleado_id` int(11) NULL DEFAULT NULL,
  `usu_observacion` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `usu_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `area_id` int(11) NULL DEFAULT NULL,
  `usu_rol` enum('Secretario (a)','Administrador') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `empresa_id` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`usu_id`) USING BTREE,
  INDEX `empleado_id`(`empleado_id`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `empresa_id`(`empresa_id`) USING BTREE,
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (36, 'DBELLIDO', '$2y$12$tXVqWA2xiQRKDqd.BP48q.TyQjq01lic1DDiqZvq.v8koppg3cnY.', '2022-11-18', NULL, NULL, NULL, 'ACTIVO', 1, 'Administrador', 3);

-- ----------------------------
-- Procedure structure for SP_CARGAR_SEGUIMIENTO_TRAMITE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SEGUIMIENTO_TRAMITE`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SEGUIMIENTO_TRAMITE`(IN `NUMERO` VARCHAR(12), IN `DNI` VARCHAR(12))
SELECT
	documento.documento_id, 
	documento.doc_dniremitente, 
	CONCAT_WS(' ',documento.doc_nombreremitente,documento.doc_apepatremitente,documento.doc_apematremitente),
	documento.doc_fecharegistro
FROM
	documento
	WHERE documento.documento_id=NUMERO and documento.doc_dniremitente=DNI
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_CARGAR_SEGUIMIENTO_TRAMITE_DETALLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SEGUIMIENTO_TRAMITE_DETALLE`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SEGUIMIENTO_TRAMITE_DETALLE`(IN `NUMERO` VARCHAR(12))
SELECT
	movimiento.movimiento_id, 
	movimiento.documento_id, 
	area.area_nombre, 
	movimiento.mov_fecharegistro, 
	movimiento.mov_descripcion, 
	movimiento.mov_estatus
FROM
	movimiento
	INNER JOIN
	area
	ON 
		movimiento.areadestino_id = area.area_cod
		where movimiento.documento_id=NUMERO
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_CARGAR_SELECT_AREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SELECT_AREA`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SELECT_AREA`()
SELECT
	area.area_cod, 
	area.area_nombre
FROM
	area
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_CARGAR_SELECT_EMPLEADO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SELECT_EMPLEADO`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SELECT_EMPLEADO`()
SELECT
	empleado.empleado_id, 
	CONCAT_WS(' ',empleado.emple_nombre,empleado.emple_apepat,empleado.emple_apemat)
FROM
	empleado
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_CARGAR_SELECT_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SELECT_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SELECT_PRODUCTO`()
SELECT
	producto.producto_id, 
	producto.producto_nombre
FROM
	producto
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_CARGAR_SELECT_TIPO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SELECT_TIPO`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SELECT_TIPO`()
SELECT
	tipo_documento.tipodocumento_id, 
	tipo_documento.tipodo_descripcion
FROM
	tipo_documento
	where tipo_documento.tipodo_estado='ACTIVO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_AREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_AREA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_AREA`()
SELECT
	area.area_cod, 
	area.area_nombre, 
	area.area_fecha_registro, 
	area.area_estado
FROM
	area
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_CLIENTE`()
SELECT
	cliente.cliente_id,
    cliente.cli_nro_ruc,
    cliente.cli_razon_social,
    cliente.cli_direccion,
    cliente.cli_celular,
    cliente.cli_email,
    cliente.cli_fecha_registro,
    cliente.cli_estatus
FROM
	cliente
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_EMPLEADO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_EMPLEADO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_EMPLEADO`()
SELECT
	empleado.empleado_id, 
	empleado.emple_nombre, 
	empleado.emple_apepat, 
	empleado.emple_apemat, 
	empleado.emple_fechanacimiento, 
	empleado.emple_nrodocumento, 
	empleado.emple_movil, 
	empleado.emple_email, 
	empleado.emple_estatus, 
	empleado.emple_direccion, 
	empleado.empl_fotoperfil,
	CONCAT_WS(' ',	empleado.emple_nombre,empleado.emple_apepat,empleado.emple_apemat) as em
FROM
	empleado
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PRODUCTO`()
SELECT
	producto.producto_id,
    producto.producto_nombre,
    producto.producto_fecha_registro,
    producto.producto_estado
FROM
	producto
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_TIPO_DOCUMENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_TIPO_DOCUMENTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_TIPO_DOCUMENTO`()
SELECT
	tipo_documento.tipodocumento_id, 
	tipo_documento.tipodo_descripcion, 
	tipo_documento.tipodo_estado,
	tipo_documento.tipodo_fregistro
FROM
	tipo_documento
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_TRAMITE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_TRAMITE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_TRAMITE`()
SELECT
	documento.documento_id, 
	documento.doc_dniremitente, 
	CONCAT_WS(' ',documento.doc_nombreremitente,documento.doc_apepatremitente,documento.doc_apematremitente) AS REMITENTE, 
	documento.tipodocumento_id, 
	tipo_documento.tipodo_descripcion, 
	documento.doc_estatus, 
	origen.area_nombre AS origen, 
	destino.area_nombre AS destino, 
	documento.doc_nrodocumento, 
	documento.doc_nombreremitente, 
	documento.doc_apepatremitente, 
	documento.doc_apematremitente, 
	documento.doc_celularremitente, 
	documento.doc_emailremitente, 
	documento.doc_direccionremitente, 
	documento.doc_representacion, 
	documento.doc_ruc, 
	documento.doc_empresa, 
	documento.doc_folio, 
	documento.doc_asunto, 
	documento.doc_fecharegistro, 
	documento.area_origen, 
	documento.area_destino
FROM
	documento
	INNER JOIN
	tipo_documento
	ON 
		documento.tipodocumento_id = tipo_documento.tipodocumento_id
	INNER JOIN
	area AS origen
	ON 
		documento.area_origen = origen.area_cod
	INNER JOIN
	area AS destino
	ON 
		documento.area_destino = destino.area_cod
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_TRAMITE_AREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_TRAMITE_AREA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_TRAMITE_AREA`(IN `IDUSUARIO` INT)
BEGIN
DECLARE IDAREA INT;
SET @IDAREA:=(select area_id from usuario where usu_id=IDUSUARIO);
SELECT
	documento.documento_id, 
	documento.doc_dniremitente, 
	CONCAT_WS(' ',documento.doc_nombreremitente,documento.doc_apepatremitente,documento.doc_apematremitente) AS REMITENTE, 
	documento.tipodocumento_id, 
	tipo_documento.tipodo_descripcion, 
	documento.doc_estatus, 
	origen.area_nombre AS origen, 
	destino.area_nombre AS destino, 
	documento.doc_nrodocumento, 
	documento.doc_nombreremitente, 
	documento.doc_apepatremitente, 
	documento.doc_apematremitente, 
	documento.doc_celularremitente, 
	documento.doc_emailremitente, 
	documento.doc_direccionremitente, 
	documento.doc_representacion, 
	documento.doc_ruc, 
	documento.doc_empresa, 
	documento.doc_folio, 
	documento.doc_asunto, 
	documento.doc_fecharegistro, 
	documento.area_origen, 
	documento.area_destino
FROM
	documento
	INNER JOIN
	tipo_documento
	ON 
		documento.tipodocumento_id = tipo_documento.tipodocumento_id
	INNER JOIN
	area AS origen
	ON 
		documento.area_origen = origen.area_cod
	INNER JOIN
	area AS destino
	ON 
		documento.area_destino = destino.area_cod
	where 	documento.area_destino=@IDAREA;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_TRAMITE_SEGUIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_TRAMITE_SEGUIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_TRAMITE_SEGUIMIENTO`(IN `ID` CHAR(11))
SELECT
	movimiento.movimiento_id, 
	movimiento.documento_id, 
	movimiento.area_origen_id, 
	area.area_nombre, 
	movimiento.mov_fecharegistro, 
	movimiento.mov_descripcion, 
	movimiento.mov_archivo
FROM
	movimiento
	INNER JOIN
	area
	ON 
		movimiento.area_origen_id = area.area_cod
		where 	movimiento.documento_id=ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_USUARIO`()
SELECT
	usuario.usu_id, 
	usuario.usu_usuario, 
	usuario.empleado_id, 
	usuario.usu_observacion, 
	usuario.usu_estatus, 
	usuario.area_id, 
	usuario.usu_rol, 
	usuario.empresa_id, 
	area.area_nombre, 
	CONCAT_WS(' ',empleado.emple_nombre,empleado.emple_apepat,empleado.emple_apemat) as nempleaddo
FROM
	usuario
	INNER JOIN
	area
	ON 
		usuario.area_id = area.area_cod
	INNER JOIN
	empleado
	ON 
		usuario.empleado_id = empleado.empleado_id
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_AREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_AREA`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_AREA`(IN `ID` INT, IN `NAREA` VARCHAR(255), IN `ESTATUS` VARCHAR(20))
BEGIN
DECLARE AREAACTUAL VARCHAR(255);
DECLARE CANTIDAD INT;
SET @AREAACTUAL:=(SELECT area_nombre from area where area_cod=ID);
IF @AREAACTUAL = NAREA THEN
		UPDATE area set
		area_estado=ESTATUS,
		area_nombre=NAREA
		where area_cod=ID;
		SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) from area where area_nombre=NAREA);
	IF @CANTIDAD = 0 THEN
		UPDATE area set
		area_estado=ESTATUS,
		area_nombre=NAREA
		where area_cod=ID;
		SELECT 1;
	ELSE
		SELECT 2;
	
	END IF;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_CLIENTE`(IN `ID` INT, IN `NRUC` CHAR(12), IN `RAZONSOCIAL` VARCHAR(150), IN `DIRECCION` VARCHAR(250), IN `CELULAR` VARCHAR(20), IN `EMAIL` VARCHAR(250), IN `ESTATUS` VARCHAR(20))
BEGIN
DECLARE NRUCACTUAL CHAR(12);
DECLARE CANTIDAD INT;
SET @NRUCACTUAL:=(SELECT cli_nro_ruc from cliente where cliente_id=ID);
IF @NRUCACTUAL = NRUC THEN
	UPDATE cliente SET
	cli_nro_ruc=NRUC,
	cli_razon_social=RAZONSOCIAL,
	cli_direccion=DIRECCION,
	cli_celular=CELULAR,
  	cli_email=EMAIL,
	cli_estatus=ESTATUS
	WHERE cliente_id=ID;
	SELECT 1;
ELSE
	SET @CANTIDAD:=(SELECT COUNT(*) FROM cliente where cli_nro_ruc=NRUC);
	IF @CANTIDAD = 0 THEN
		UPDATE cliente SET
        cli_nro_ruc=NRUC,
        cli_razon_social=RAZONSOCIAL,
        cli_direccion=DIRECCION,
        cli_celular=CELULAR,
        cli_email=EMAIL,
        cli_estatus=ESTATUS
        WHERE cliente_id=ID;
		SELECT 1;
	ELSE
	SELECT 2;
	END IF;

END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_EMPLEADO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_EMPLEADO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_EMPLEADO`(IN `ID` INT, IN `NDOCUMENTO` CHAR(12), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `FECHA` DATE, IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAIL` VARCHAR(255), IN `ESTATUS` VARCHAR(20))
BEGIN
DECLARE NDOCUMENTOACTUAL CHAR(12);
DECLARE CANTIDAD INT;
SET @NDOCUMENTOACTUAL:=(SELECT emple_nrodocumento from empleado where empleado_id=ID);
IF @NDOCUMENTOACTUAL = NDOCUMENTO THEN
	UPDATE empleado SET
	emple_nrodocumento=NDOCUMENTO,
	emple_nombre=NOMBRE,
	emple_apepat=APEPAT,
	emple_apemat=APEMAT,
  emple_fechanacimiento=FECHA,
	emple_movil=MOVIL,
	emple_direccion=DIRECCION,
	emple_email=EMAIL,
	emple_estatus=ESTATUS
	WHERE empleado_id=ID;
	SELECT 1;
ELSE
	SET @CANTIDAD:=(SELECT COUNT(*) FROM empleado where emple_nrodocumento=NDOCUMENTO);
	IF @CANTIDAD = 0 THEN
		UPDATE empleado SET
		emple_nrodocumento=NDOCUMENTO,
		emple_nombre=NOMBRE,
		emple_apepat=APEPAT,
		emple_apemat=APEMAT,
		emple_fechanacimiento=FECHA,
		emple_movil=MOVIL,
		emple_direccion=DIRECCION,
		emple_email=EMAIL,
		emple_estatus=ESTATUS
		WHERE empleado_id=ID;
		SELECT 1;
	ELSE
	SELECT 2;
	END IF;

END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_PRODUCTO`(IN `ID` INT, IN `NOMBRE` VARCHAR(100), IN `ESTATUS` VARCHAR(20))
BEGIN
DECLARE NOMBREACTUAL VARCHAR(100);
DECLARE CANTIDAD INT;
SET @NOMBREACTUAL:=(SELECT producto_nombre from producto where producto_id=ID);
IF @NOMBREACTUAL = NOMBRE THEN
		UPDATE producto set
		producto_estado=ESTATUS,
		producto_nombre=NOMBRE
		where producto_id=ID;
		SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) from producto where producto_nombre=NOMBRE);
	IF @CANTIDAD = 0 THEN
		UPDATE producto set
		producto_estado=ESTATUS,
		producto_nombre=NOMBRE
		where producto_id=ID;
		SELECT 1;
	ELSE
		SELECT 2;
	
	END IF;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_TIPO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_TIPO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_TIPO`(IN `ID` INT, IN `NTIPO` VARCHAR(255), IN `ESTATUS` VARCHAR(20))
BEGIN
DECLARE TIPOACTUAL VARCHAR(255);
DECLARE CANTIDAD INT;
SET @TIPOACTUAL:=(SELECT tipodo_descripcion  FROM tipo_documento where tipodocumento_id=ID);
IF @TIPOACTUAL = NTIPO THEN
  UPDATE tipo_documento set
	tipodo_descripcion=NTIPO,
	tipodo_estado=ESTATUS
	where tipodocumento_id=ID;
	SELECT 1;
ELSE
	SET @CANTIDAD:=(SELECT COUNT(*) FROM tipo_documento where tipodo_descripcion=NTIPO);
	IF @CANTIDAD = 0 THEN
		UPDATE tipo_documento set
		tipodo_descripcion=NTIPO,
		tipodo_estado=ESTATUS
		where tipodocumento_id=ID;
		SELECT 1;
		SELECT 1;
	ELSE
		SELECT 2;
END IF;

END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_USUARIO`(IN `ID` INT, IN `IDEMPLEADO` INT, IN `IDAREA` INT, IN `ROL` VARCHAR(25))
UPDATE usuario set
empleado_id=IDEMPLEADO,
area_id=IDAREA,
usu_rol=ROL
where usu_id=ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_USUARIO_CONTRA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_USUARIO_CONTRA`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_USUARIO_CONTRA`(IN `ID` INT, IN `CONTRA` VARCHAR(250))
UPDATE usuario set
usu_contra=CONTRA
where usu_id=ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_USUARIO_ESTATUS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_USUARIO_ESTATUS`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_USUARIO_ESTATUS`(IN `ID` INT, IN `ESTATUS` VARCHAR(20))
UPDATE usuario set
usu_estatus=ESTATUS
where usu_id=ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_AREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_AREA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_AREA`(IN `NAREA` VARCHAR(255))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM area where area_nombre=NAREA);
IF @CANTIDAD = 0 THEN
	INSERT INTO area(area_nombre,area_fecha_registro)VALUES(NAREA,NOW());
	SELECT 1;
ELSE
	SELECT 2;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_CLIENTE`(IN `NRUC` CHAR(12), IN `RAZONSOCIAL` VARCHAR(150), IN `DIRECCION` VARCHAR(250), IN `CELULAR` VARCHAR(20), IN `EMAIL` VARCHAR(250))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM cliente where cli_nro_ruc=NRUC);
IF @CANTIDAD = 0 THEN
	INSERT INTO cliente(cli_nro_ruc,cli_razon_social ,cli_direccion,cli_celular,cli_email,cli_estatus) VALUES(NRUC,RAZONSOCIAL,DIRECCION,CELULAR,EMAIL,'ACTIVO');
	SELECT 1;
ELSE
SELECT 2;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_DOCUMENTO_DETALLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DOCUMENTO_DETALLE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_DOCUMENTO_DETALLE`(IN IDDOC CHAR(12),IN IDPRODUCTO INT,IN CANTIDAD INT,IN PRECIO DECIMAL(10,2),IN SUBTOTAL DECIMAL(10,2))
INSERT INTO detalle_documento(documento_id,producto_id,detadocu_cantidad,detadocu_precio,detadocu_subtotal) VALUES(IDDOC,IDPRODUCTO,CANTIDAD,PRECIO,SUBTOTAL)
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_EMPLEADO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_EMPLEADO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_EMPLEADO`(IN `NDOCUMENTO` CHAR(12), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `FECHA` DATE, IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAIL` VARCHAR(255))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM empleado where emple_nrodocumento=NDOCUMENTO);
IF @CANTIDAD = 0 THEN
	INSERT INTO empleado(emple_nrodocumento,emple_nombre,emple_apepat,emple_apemat,emple_fechanacimiento,emple_movil,emple_direccion,emple_email,emple_feccreacion,emple_estatus,empl_fotoperfil) VALUES(NDOCUMENTO,NOMBRE,APEPAT,APEMAT,FECHA,MOVIL,DIRECCION,EMAIL,CURDATE(),'ACTIVO','controller/empleado/FOTOS/admin.png');
	SELECT 1;
ELSE
SELECT 2;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PRODUCTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PRODUCTO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_PRODUCTO`(IN `NOMBRE` VARCHAR(100))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM producto where producto_nombre=NOMBRE);
IF @CANTIDAD = 0 THEN
	INSERT INTO producto(producto_nombre,producto_fecha_registro)VALUES(NOMBRE,NOW());
	SELECT 1;
ELSE
	SELECT 2;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_TIPO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_TIPO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_TIPO`(IN `NTIPO` VARCHAR(255))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM tipo_documento where tipodo_descripcion=NTIPO);
IF @CANTIDAD = 0 THEN
	INSERT INTO tipo_documento(tipodo_descripcion,tipodo_estado,tipodo_fregistro) VALUES(NTIPO,'ACTIVO',NOW());
	SELECT 1;
ELSE
	SELECT 2;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_TRAMITE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_TRAMITE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_TRAMITE`(IN `IDCLIENTE` INT, IN `TOTAL` DECIMAL(10,2),IN IDUSUARIO INT,IN `AREAPRINCIPAL` INT, IN `AREADESTINO` INT, IN `ASUNTO` VARCHAR(255), IN `RUTA` VARCHAR(255))
BEGIN
DECLARE cantidad INT;
declare cod char(12);
SET @cantidad :=(SELECT count(*) FROM documento );
IF @cantidad >= 1 AND @cantidad <= 8  THEN
SET @cod :=(SELECT CONCAT('D000000',(@cantidad+1)));
ELSEIF @cantidad >=9 AND @cantidad <=98 THEN
SET @cod :=(SELECT CONCAT('D00000',(@cantidad+1)));
ELSEIF @cantidad >=99 AND @cantidad <=998 THEN
SET @cod :=(SELECT CONCAT('D0000',(@cantidad+1)));
ELSEIF @cantidad >=999 AND @cantidad <=9998 THEN
SET @cod :=(SELECT CONCAT('D000',(@cantidad+1)));
ELSEIF @cantidad >=9999 AND @cantidad <=99998 THEN
SET @cod :=(SELECT CONCAT('D00',(@cantidad+1)));
ELSEIF @cantidad >=99999 AND @cantidad <=999998 THEN
SET @cod :=(SELECT CONCAT('D0',(@cantidad+1)));
ELSEIF @cantidad >=999999 THEN
SET @cod :=(SELECT CONCAT('D',(@cantidad+1)));
ELSE
SET @cod :=(SELECT CONCAT('D0000001'));
END IF;
INSERT INTO documento(documento_id,cliente_id,area_origen,area_destino,doc_asunto,doc_archivo,area_id,usuario_id,documento_total) VALUES(@cod,IDCLIENTE,AREAPRINCIPAL,AREADESTINO,ASUNTO,RUTA,AREADESTINO,IDUSUARIO,TOTAL);
SELECT @cod;
INSERT INTO movimiento(documento_id,area_origen_id,areadestino_id,mov_fecharegistro,mov_descripcion,mov_estatus,usuario_id,mov_archivo) VALUES(@cod,AREAPRINCIPAL,AREADESTINO,NOW(),ASUNTO,'PENDIENTE',IDUSUARIO,RUTA);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_TRAMITE_DERIVAR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_TRAMITE_DERIVAR`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_TRAMITE_DERIVAR`(IN `ID` CHAR(15), IN `ORIGEN` INT, IN `DESTINO` INT, IN `DESCRIPCION` VARCHAR(255), IN `IDUSUARIO` INT, IN `RUTA` VARCHAR(255), IN `TIPO` VARCHAR(255))
BEGIN
DECLARE IDMOVIMENTO INT;
SET @IDMOVIMENTO:=(select movimiento_id from movimiento where mov_estatus='PENDIENTE' AND documento_id=ID);
IF TIPO = "FINALIZAR" THEN

UPDATE movimiento SET
mov_estatus='FINALIZADO'
where movimiento_id=@IDMOVIMENTO;
UPDATE documento SET
area_origen=ORIGEN,
area_destino=ORIGEN,
doc_estatus='FINALIZADO'
WHERE documento_id=ID;
INSERT INTO movimiento(documento_id,area_origen_id,areadestino_id,mov_fecharegistro,mov_descripcion,mov_estatus,usuario_id,mov_archivo) VALUES(ID,ORIGEN,ORIGEN,NOW(),DESCRIPCION,'FINALIZADO',IDUSUARIO,RUTA);

ELSE

UPDATE movimiento SET
mov_estatus='DERIVADO'
where movimiento_id=@IDMOVIMENTO;
UPDATE documento SET
area_origen=ORIGEN,
area_destino=DESTINO
WHERE documento_id=ID;
INSERT INTO movimiento(documento_id,area_origen_id,areadestino_id,mov_fecharegistro,mov_descripcion,mov_estatus,usuario_id,mov_archivo) VALUES(ID,ORIGEN,DESTINO,NOW(),DESCRIPCION,'PENDIENTE',IDUSUARIO,RUTA);

END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_USUARIO`(IN `USU` VARCHAR(250), IN `CONTRA` VARCHAR(255), IN `IDEMPLEADO` INT, IN `IDAREA` INT, IN `ROL` VARCHAR(25))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario where usu_usuario=USU);
IF @CANTIDAD = 0 THEN
	
	INSERT INTO usuario(usu_usuario,usu_contra,empleado_id,area_id,usu_rol,usu_feccreacion,usu_estatus,empresa_id) VALUES(USU,CONTRA,IDEMPLEADO,IDAREA,ROL,CURDATE(),'ACTIVO',1);
	SELECT 1;

ELSE

SELECT 2;
END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TRAER_DATOS_RUC
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TRAER_DATOS_RUC`;
delimiter ;;
CREATE PROCEDURE `SP_TRAER_DATOS_RUC`(IN RUC VARCHAR(30))
SELECT 
	cliente.cliente_id, 
	cliente.cli_nro_ruc, 
	cliente.cli_razon_social, 
	cliente.cli_direccion, 
	cliente.cli_celular, 
	cliente.cli_email
FROM
	cliente
	where cliente.cli_nro_ruc=RUC
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TRAER_WIDGET
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TRAER_WIDGET`;
delimiter ;;
CREATE PROCEDURE `SP_TRAER_WIDGET`()
SELECT
	(select COUNT(*) FROM documento),
	(select COUNT(*) FROM documento where doc_estatus="FINALIZADO")
FROM
	documento LIMIT 1
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_VERIFICAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_VERIFICAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_VERIFICAR_USUARIO`(IN `USU` VARCHAR(255))
SELECT
	usuario.usu_id, 
	usuario.usu_usuario, 
	usuario.usu_contra, 
	usuario.usu_feccreacion, 
	usuario.usu_fecupdate, 
	usuario.empleado_id, 
	usuario.usu_observacion, 
	usuario.usu_estatus, 
	usuario.area_id, 
	usuario.usu_rol, 
	usuario.empresa_id
FROM
	usuario
	where usuario.usu_usuario  = BINARY USU
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
