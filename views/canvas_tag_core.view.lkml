include: "//@{CONFIG_PROJECT_NAME}/views/canvas_tag.view.lkml"


view: canvas_tag {
  extends: [canvas_tag_config]
}

###################################################

view: canvas_tag_core {
  sql_table_name: @{DATASET_NAME}.CANVAS_TAG ;;

  dimension: canvas_id {
    hidden: yes
    type: number
    sql: ${TABLE}.canvas_id ;;
    description: "id of the Canvas if from a canvas"
  }

  dimension_group: canvas_updated {
    hidden: yes
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.canvas_updated_at) ;;
    timeframes:
    [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
  }

  dimension: tag {
    hidden: yes
    type: number
    sql: ${TABLE}.tag ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [canvas.name, canvas.id]
  }
}
