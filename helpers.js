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
    group_by
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
  opt.user_id = req.user.id;
  offset = parseInt(offset);
  limit = parseInt(limit);

  if (soft_delete) opt.soft_delete = soft_delete == "true";
  if (verbose) opt.verbose = verbose == "true";
  if (limit > 0) opt.limit = limit;
  if (offset > 0) opt.offset = offset;
  if (sort_by) opt.order_by = sort_by;
  if (group_by) opt.group_by = group_by;
  //console.log("option", opt);
  return opt;
};
