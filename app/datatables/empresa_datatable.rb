class EmpresaDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id:         { source: "User.id" },
      first_name: { source: "User.first_name", cond: :like, searchable: true, orderable: true },
      last_name:  { source: "User.last_name",  cond: :like, nulls_last: true },
      email:      { source: "User.email" },
      bio:        { source: "User.bio" },
    }
  end

  def data
    records.map do |record|
      {
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
  end

end
