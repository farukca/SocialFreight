class Search < ActiveRecord::Base

  attr_accessor :session_loading_ids

  default_scope { where(patron_id: Patron.current_id) }

  def positions
    @positions = find_positions
  end

  def loadings
    @loadings = find_loadings
  end

  def reservations
    @reservations = find_reservations
  end

  def companies
    @companies = find_companies
  end

  def contacts
    @contacts = find_contacts
  end

  def transports
    @transports = find_transports
  end

  private
  def find_positions
    positions = Position.active
    positions = positions.where(operation: self.operation) if self.operation.present?
    positions = positions.where(direction: self.direction) if self.direction.present?
    positions = positions.where(branch_id: self.branch_id) if self.branch_id.present?
    positions
  end

  def find_loadings
    loadings = Loading.active
    loadings = loadings.where(company_id: self.company_id) if self.company_id.present?
    loadings = loadings.where(operation: self.operation) if self.operation.present?
    loadings = loadings.where(direction: self.direction) if self.direction.present?
    loadings
  end

  def find_reservations
    reservations = Loading.active.reservation
    reservations = reservations.where(operation: self.operation) if self.operation.present?
    reservations = reservations.where(direction: self.direction) if self.direction.present?
    reservations = reservations.where('id not in (?)', self.session_loading_ids) if self.session_loading_ids.present?
    reservations
  end

  def find_companies
    companies = Company.latest
    companies = companies.where("lower(name) like ?", "%#{self.reference}%") if self.reference.present?
    companies = companies.where(created_at: self.docdate1..self.docdate2) if self.docdate1.present?
    companies = companies.where(branch_id: self.branch_id) if self.branch_id.present?
    companies = companies.where(country_id: self.country_id) if self.country_id.present?
    companies
  end

  def find_contacts
    contacts  = Contact.latest
    contacts  = contacts.where(company_id: self.company_id) if self.company_id.present?
    contacts  = contacts.where("lower(name) like ?", "%#{self.reference}%") if self.reference.present?
    contacts
  end

  def find_transports
    transports = Transport.active
    transports = transports.where(trans_method: self.operation) if self.operation.present?
    transports = transports.where(supplier_id: self.company_id) if self.company_id.present?
    transports = transports.where(branch_id: self.branch_id) if self.branch_id.present?
    transports = transports.where(created_at: self.docdate1..self.docdate2) if self.docdate1.present?
    transports
  end
end