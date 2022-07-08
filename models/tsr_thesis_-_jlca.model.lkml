# Define the database connection to be used for this model.
connection: "faa_redshift"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: tsr_thesis_jlca_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: tsr_thesis_jlca_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Tsr Thesis - Jlca"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: accidents {
  hidden: yes
}

explore: aircraft {
  hidden: yes
}

explore: aircraft_models {
  #hidden: yes
}

explore: airport_dt {
  #hidden: yes
}

explore: airports {
  join: accidents {
    type: left_outer
    sql_on: ${airports.code} = ${accidents.airport_code} ;;
    relationship: many_to_one
  }
  join: aircraft {
    type: left_outer
    sql_on: ${accidents.registration_number} = ${aircraft.tail_num} ;;
    relationship: many_to_one
  }
  join: flights {
    type: left_outer
    sql_on: ${aircraft.tail_num} = ${flights.tail_num} ;;
    relationship: many_to_one
  }
  join: ontime {
    type: left_outer
    sql_on: ${flights.flight_num} = ${ontime.flight_num} ;;
    relationship: many_to_one
  }
  join: carriers {
    type: left_outer
    sql_on: ${flights.carrier} = ${carriers.code} ;;
    relationship: many_to_one
  }
}

explore: carriers {
  hidden: yes
}

explore: flights {
  hidden: yes
}

explore: ontime {
  hidden: yes
}

explore: regions {
  hidden: yes
}
