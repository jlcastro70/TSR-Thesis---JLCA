# The name of this view in Looker is "Cal454"
view: cal454 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.cal454 ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Dow454" in Explore.

  dimension: dow454 {
    type: number
    sql: ${TABLE}.dow454 ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_dow454 {
    type: sum
    sql: ${dow454} ;;
  }

  measure: average_dow454 {
    type: average
    sql: ${dow454} ;;
  }

  dimension: month454 {
    type: number
    sql: ${TABLE}.month454 ;;
  }

  dimension: quarter454 {
    type: number
    sql: ${TABLE}.quarter454 ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: transdate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.transdate ;;
  }

  dimension: week454 {
    type: number
    sql: ${TABLE}.week454 ;;
  }

  dimension: year454 {
    type: number
    sql: ${TABLE}.year454 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
