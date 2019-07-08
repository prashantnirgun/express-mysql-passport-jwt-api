const pool = require("../database");
let protectedFields = [
  "deleted_by_user_id",
  "deleted_at",
  "created_at",
  "created_by_user_id",
  "updated_at",
  "updated_by_user_id"
];

//protected $timestamps = TRUE;
const timestamps_format = "Y-m-d H:i:s";
const specialFields = {
  created_at_field: "created_at",
  updated_at_field: "updated_at",
  deleted_at_field: "deleted_at",
  created_by_field: "created_by_user_id",
  updated_by_field: "updated_by_user_id",
  deleted_by_field: "deleted_by_user_id"
};

module.exports = {
  member: {
    protectedFields,
    fields: [
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
    primaryKey: ["id"],
    type: "table",
    soft_delete: true
  },
  member_view: {
    protectedFields,
    fields: [
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
    ],
    type: "view",
    soft_delete: true
  },
  account_format: {
    protectedFields,
    fields: ["account_format_id", "branch_id", "account_format_name", "side"],
    primaryKey: ["account_format_id"],
    type: "table",
    soft_delete: false
  },
  account_group: {
    protectedFields,
    fields: [
      "account_group_id",
      "branch_id",
      "account_group_name",
      "alias",
      "account_head_id",
      "statutory",
      "primary_group",
      "primary_name",
      "herarcy",
      "io"
    ],
    primaryKey: ["account_group_id"],
    type: "table",
    soft_delete: false
  },
  account_head: {
    protectedFields,
    fields: [
      "account_head_id",
      "branch_id",
      "account_head_name",
      "account_format_id",
      "io"
    ],
    primaryKey: ["account_head_id"],
    type: "table",
    soft_delete: false
  },
  address: {
    protectedFields,
    fields: [
      "address_id",
      "reference_id",
      "table_name",
      "address_name",
      "default_address",
      "add1",
      "add2",
      "add3",
      "telephone",
      "email"
    ],
    primaryKey: ["address_id"],
    type: "table",
    soft_delete: false
  },
  branch: {
    protectedFields,
    fields: ["branch_id", "company_id", "branch_name", "gst", "pancard"],
    primaryKey: ["branch_id"],
    type: "table",
    soft_delete: false
  },
  branch_godown: {
    protectedFields,
    fields: ["branch_godown_id", "branch_id", "godown_id"],
    primaryKey: ["branch_godown_id"],
    type: "table",
    soft_delete: false
  },
  client_column_property: {
    protectedFields,
    fields: [
      "client_column_property_id",
      "company_id",
      "column_property_id",
      "column_id",
      "column_name",
      "set_default",
      "statutary_id",
      "archive_id"
    ],
    primaryKey: ["client_column_property_id"],
    type: "table",
    soft_delete: false
  },
  column_property: {
    protectedFields,
    fields: [
      "column_property_id",
      "column_group",
      "statutary_id",
      "description",
      "archive_id"
    ],
    primaryKey: ["column_property_id"],
    type: "table",
    soft_delete: false
  },
  company: {
    protectedFields,
    fields: ["company_id", "company_name", "company_type_id", "inventory"],
    primaryKey: ["company_id"],
    type: "table",
    soft_delete: false
  },
  default_narration: {
    protectedFields,
    fields: ["default_narration_id", "branch_id", "narration", "voucher_id"],
    primaryKey: ["default_narration_id"],
    type: "table",
    soft_delete: false
  },
  general_ledger: {
    protectedFields,
    fields: [
      "general_ledger_id",
      "branch_id",
      "general_ledger_name",
      "alias",
      "account_group_id",
      "statutory",
      "primary_name",
      "debit_credit_id",
      "opening_amount",
      "gst_no",
      "pancard_no",
      "adhard_no",
      "ie_code",
      "reference_no",
      "email",
      "rmn",
      "mobile",
      "telephone",
      "contact_person",
      "maintain_bill",
      "credit_period",
      "credit_limit",
      "herarcy",
      "tag",
      "fav",
      "io",
      "remark"
    ],
    primaryKey: ["general_ledger_id"],
    type: "table",
    soft_delete: false
  },
  godown: {
    protectedFields,
    fields: ["godown_id", "company_id", "godown_name"],
    primaryKey: ["godown_id"],
    type: "table",
    soft_delete: false
  },
  item: {
    protectedFields,
    fields: [
      { name: "item_id", required: true, dataType: "signed" },
      { name: "branch_id", required: true, dataType: "signed" },
      { name: "item_name", required: true, dataType: "signed" },
      { name: "item_group_id", required: true, dataType: "signed" },
      { name: "unit_id", required: true, dataType: "signed" },
      { name: "hsn", required: false, dataType: "string", default: "null" },
      { name: "io", required: false, dataType: "string", default: "null" }
    ],
    specialFields,
    primaryKey: ["item_id"],
    type: "table",
    soft_delete: false
  },
  item_dtl: {
    protectedFields,
    fields: [
      "co_id",
      "item_id",
      "pur_rate",
      "sales_rate",
      "mrp",
      "self_price",
      "pur_dis",
      "sales_dis",
      "min_sales_rate",
      "tax_id",
      "warning_flag",
      "Min_qty",
      "min_days",
      "rol",
      "rol_days",
      "Max_qty",
      "max_days",
      "barcode"
    ],
    primaryKey: ["co_id", "item_id"],
    type: "table",
    soft_delete: false
  },
  item_group: {
    protectedFields,
    fields: ["item_group_id", "branch_id", "item_group_name", "io"],
    primaryKey: ["item_group_id"],
    type: "table",
    soft_delete: false
  },
  system_configuration: {
    protectedFields,
    fields: [
      "id",
      "company_id",
      "description",
      "value_1",
      "value_2",
      "value_3"
    ],
    primaryKey: ["company_id", "id"],
    type: "table",
    soft_delete: false
  },
  tax: {
    protectedFields,
    fields: [
      "tax_id",
      "branch_id",
      "tax_name",
      "register",
      "method",
      "round_up",
      "tax_gl_id"
    ],
    primaryKey: ["tax_id"],
    type: "table",
    soft_delete: false
  },
  tax_detail: {
    protectedFields,
    fields: [
      "tax_detail_id",
      "tax_id",
      "wef_date",
      "file_id",
      "reference_id",
      "rate",
      "priority"
    ],
    primaryKey: ["tax_detail_id"],
    type: "table",
    soft_delete: false
  },
  unit: {
    protectedFields,
    fields: [
      "unit_id",
      "branch_id",
      "unit_name",
      "unit_per_quantity",
      "unit_base"
    ],
    primaryKey: ["unit_id"],
    type: "table",
    soft_delete: false
  },
  user: {
    protectedFields,
    fields: [
      "user_id",
      "company_id",
      "user_group_id",
      "login_status_id",
      "user_name",
      "login_name",
      "email_id",
      "mobile",
      "password",
      "user_status_id",
      "login_attempt",
      "otp",
      "otp_expiry",
      "token",
      "token_expiry",
      "archive_id"
    ],
    primaryKey: ["user_id"],
    type: "table",
    soft_delete: false
  },
  user_group: {
    protectedFields,
    fields: [
      "user_group_id",
      "company_id",
      "user_group_name",
      "status_id",
      "archieve"
    ],
    primaryKey: ["user_group_id"],
    type: "table",
    soft_delete: false
  },
  voucher_type: {
    protectedFields,
    fields: [
      "voucher_type_id",
      "branch_id",
      "voucher_type_name",
      "statutary",
      "primary_type",
      "prefix",
      "suffix",
      "default_narration",
      "starting_no",
      "rounding_method"
    ],
    primaryKey: ["voucher_type_id"],
    type: "table",
    soft_delete: false
  },
  year: {
    protectedFields,
    fields: ["year_id", "company_id", "start_date", "end_date"],
    primaryKey: ["year_id"],
    type: "table",
    soft_delete: false
  },
  account_group_view: {
    fields: ["branch_id", "account_group_id", "account_group_name"],
    type: "view",
    soft_delete: false
  },
  account_head_view: {
    fields: ["branch_id", "account_head_id", "account_head_name"],
    type: "view",
    soft_delete: false
  },
  column_value_view: {
    fields: [
      "company_id",
      "column_group",
      "column_id",
      "column_name",
      "set_default"
    ],
    type: "view",
    soft_delete: false
  },
  company_view: {
    fields: [
      "company_id",
      "company_name",
      "branch_id",
      "branch_name",
      "add1",
      "add2",
      "add3",
      "telephone",
      "email"
    ],
    type: "view",
    soft_delete: false
  },
  general_ledger_address_view: {
    fields: [
      "general_ledger_id",
      "branch_id",
      "general_ledger_name",
      "alias",
      "account_group_id",
      "address_name",
      "add1",
      "add2",
      "add3",
      "telephone",
      "email"
    ],
    type: "view",
    soft_delete: false
  },
  general_ledger_view: {
    fields: [
      "branch_id",
      "general_ledger_id",
      "general_ledger_name",
      "opening",
      "alias"
    ],
    type: "view",
    soft_delete: false
  },
  item_view: {
    fields: [
      "branch_id",
      "item_id",
      "item_name",
      "hsn",
      "item_group_id",
      "item_group_name",
      "unit_id",
      "unit_name",
      "io"
    ],
    type: "view",
    soft_delete: false
  }
};
