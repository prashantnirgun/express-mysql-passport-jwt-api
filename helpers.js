exports.siteName = "This is a tile";

exports.parseResultSet = data => JSON.parse(JSON.stringify(data));

exports.readBody = function(req) {
  let opt = {};
  let {
    offset,
    limit,
    fields,
    soft_delete,
    verbose,
    sort_by,
    group_by,
    total_rows
  } = req.query;
  opt.method = req.method;
  if (opt.method === "PUT") {
    opt.fields = req.body;
  } else {
    fields = fields ? fields.split(",") : undefined;
    if (fields) {
      opt.columns = fields;
    }
  }
  if (req.user) opt.user_id = req.user.user_id;
  offset = parseInt(offset);
  limit = parseInt(limit);

  if (soft_delete) opt.soft_delete = soft_delete == "true";
  if (verbose) opt.verbose = verbose == "true";
  if (limit > 0) opt.limit = limit;
  if (offset > 0) opt.offset = offset;
  if (sort_by) opt.order_by = sort_by;
  if (group_by) opt.group_by = group_by;
  if (total_rows) {
    opt.total_rows = total_rows == "true" ? true : false;
  } else {
    opt.total_rows = false;
  }
  return opt;
};
