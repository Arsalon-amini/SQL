	SELECT
			COUNT(DISTINCT LEFT (last_name, 1)) AS cardinalityOneCharIndex,
            COUNT(DISTINCT LEFT (last_name, 5)) AS cardinalityFiveCharIndex,
            COUNT(DISTINCT LEFT (last_name, 5)) AS cardinalityFiveCharIndex,
            COUNT(DISTINCT LEFT (last_name, 10)) AS cardinalityTenCharIndex

	FROM customers;