json.(loading, :id, :reference, :operation, :direction, :status, :load_coun, :unload_coun, :incoterm, :freight_price, :freight_curr, :slug, :commodity, :category)
json.customer company_name(loading.company)
json.branch branch_name(loading.branch)