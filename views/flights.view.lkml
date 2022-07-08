# The name of this view in Looker is "Flights"
view: flights {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.flights ;;

  parameter: airlinecarrier {
    required_fields: [carrier]
    type: string
    full_suggestions: yes
    allowed_value: { value: "AA"}
    allowed_value: { value: "AQ"}
    allowed_value: { value: "AS"}
    allowed_value: { value: "B6"}
    allowed_value: { value: "CO"}
    allowed_value: { value: "DH"}
    allowed_value: { value: "DL"}
    allowed_value: { value: "EV"}
    allowed_value: { value: "FL"}
    allowed_value: { value: "HA"}
    allowed_value: { value: "HP"}
    allowed_value: { value: "MQ"}
    allowed_value: { value: "NW"}
    allowed_value: { value: "OH"}
    allowed_value: { value: "OO"}
    allowed_value: { value: "RU"}
    allowed_value: { value: "TW"}
    allowed_value: { value: "TZ"}
    allowed_value: { value: "UA"}
    allowed_value: { value: "US"}
    allowed_value: { value: "WN"}
  }

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Arr Delay" in Explore.

  dimension: arr_delay {
    type: number
    sql: ${TABLE}.arr_delay ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_arr_delay {
    type: sum
    sql: ${arr_delay} ;;
  }

  measure: average_arr_delay {
    type: average
    sql: ${arr_delay} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: arr {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.arr_time ;;
  }

  dimension: cancelled {
    type: string
    sql: ${TABLE}.cancelled ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension: dep_delay {
    type: number
    sql: ${TABLE}.dep_delay ;;
  }

  dimension_group: dep {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dep_time ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
    link: {
      label: "A new label"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension: flight_num {
    type: string
    sql: ${TABLE}.flight_num ;;
  }

  dimension: flight_time {
    type: number
    sql: ${TABLE}.flight_time ;;
  }

  dimension: id2 {
    type: number
    sql: ${TABLE}.id2 ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: tail_num {
    type: string
    sql: ${TABLE}.tail_num ;;
  }

  measure: total_cancelled_conditional {
    type: string
    sql: ${cancelled} ;;
    #value_format_name: yesno
    html: {% if value == "N" %}
          <p style="color: white; background-color: ##FFC20A; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p>
          {% elsif value == "Y" %}
          <p style="color: white; background-color: #0C7BDC; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p>
          {% endif %}
          ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
