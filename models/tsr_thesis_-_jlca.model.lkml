# Define the database connection to be used for this model.
connection: "faa_redshift"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: tsr_thesis_-_jlca_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: tsr_thesis_-_jlca_default_datagroup

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
  hidden: yes
}

explore: airports {
  hidden: yes
}

explore: blah {
  hidden: yes
}

explore: cal454 {
  hidden: yes
}

explore: carriers {
  hidden: yes
}

explore: case_sensitive {
  hidden: yes
}

explore: flights {
  join: carriers {
    type: left_outer
    sql_on: ${flights.carrier} = ${carriers.code} ;;
    relationship: many_to_one
  }

  join: aircraft {
    type: left_outer
    sql_on: ${flights.tail_num} = ${aircraft.tail_num} ;;
    relationship: many_to_one
  }

  join: aircraft_origin {
    from: airports
    type: left_outer
    sql_on: ${flights.origin} = ${aircraft_origin.code} ;;
    relationship: many_to_one
    fields: [full_name, city, state, code, location]
  }

  join: aircraft_destination {
    from: airports
    type: left_outer
    sql_on: ${flights.destination} = ${aircraft_destination.code} ;;
    relationship: many_to_one
    fields: [full_name, city, state, code]
  }

  join: aircraft_models {
    sql_on: ${aircraft.aircraft_model_code} = ${aircraft_models.aircraft_model_code} ;;
    relationship: many_to_one
  }
}

explore: flights2 {
  hidden: yes
}

explore: flights_by_day {
  hidden: yes
}

explore: flights_dk {
  hidden: yes
}

explore: myevent {
  hidden: yes
}

explore: myevent_2 {
  hidden: yes
}

explore: ontime {
  hidden: yes
}

explore: regions {
  hidden: yes
}

explore: temp2 {
  hidden: yes
}

explore: test {
  hidden: yes
}
