const pool = require("../database");
let protectedFields = [
  "deleted_by_user_id",
  "deleted_at",
  "created_at",
  "created_by_user_id",
  "updated_at",
  "updated_by_user_id"
];
module.exports = {
  member: {
    protectedFields,
    allFields: [
      "company_id",
      "branch_id",
      "sap_id",
      "reference_no",
      "salutation_id",
      "name",
      "member_status_id",
      "basic_salary",
      "city_id",
      "remarks"
    ],
    tableName: "member",
    primaryKey: ["id"]
  },
  member_view: {
    protectedFields,
    allFields: [
      "company_id",
      "branch_id",
      "member_id",
      "sap_id",
      "reference_no",
      "member_name",
      "city_name",
      "telephone_no",
      "gender",
      "member_status",
      "retirement_date"
    ]
  }
};
