view: airport_dt {
    derived_table: {
      sql: SELECT
          airports.full_name  AS "airports.full_name",
          airports.city  AS "airports.city",
          CASE WHEN airports.latitude  IS NOT NULL AND airports.longitude  IS NOT NULL THEN (
      COALESCE(CAST(airports.latitude  AS VARCHAR),'') || ',' ||
      COALESCE(CAST(airports.longitude  AS VARCHAR),'')) ELSE NULL END
       AS "airports.location"
      FROM public.airports  AS airports
      WHERE (airports.city ) = 'SEATTLE                       '
      GROUP BY
          1,
          2,
          3
      ORDER BY
          1
      LIMIT 500
       ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: airports_full_name {
      type: string
      sql: ${TABLE}."airports.full_name" ;;
    }

    dimension: airports_city {
      type: string
      sql: ${TABLE}."airports.city" ;;
    }

    dimension: airports_location {
      type: string
      sql: ${TABLE}."airports.location" ;;
    }

    set: detail {
      fields: [airports_full_name, airports_city, airports_location]
    }
  }
