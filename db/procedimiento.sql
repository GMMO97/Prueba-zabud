CREATE DEFINER=`root`@`localhost` PROCEDURE `agregaryeditarcarros`(
		IN _id INT,
        IN _marca VARCHAR(45),
        IN _modelo VARCHAR(45),
        IN _color VARCHAR(45)
)
BEGIN
	IF _id = 0 THEN
		INSERT INTO carros(marca,modelo,color)
		VALUES (_marca, _modelo, _color);
		SET _id= LAST_INSERT_ID();
    ELSE
		UPDATE carros
        SET
			marca = _marca,
            modelo = _modelo,
            color = _color
			WHERE id = _id;
   END IF;
   
   SELECT _id AS id;
END