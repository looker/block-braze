view: app_install_attribution {
  sql_table_name: braze.APP_INSTALL_ATTRIBUTION ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}