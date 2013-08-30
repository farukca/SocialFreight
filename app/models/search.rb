class Search < ActiveRecord::Base

  serialize :filter, ActiveRecord::Coders::Hstore

  attr_accessor :session_loading_ids

  default_scope { where(patron_id: Nimbos::Patron.current_id) }

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

  def vehicles
    @vehicles = find_vehicles
  end

  def wares
    @wares = find_wares
  end

  def tickets
    @tickets = find_tickets
  end

  private
  def find_positions
    positions = Position.active
    #positions = positions.where(operation: self.operation) if self.operation.present?
    #positions = positions.where(direction: self.direction) if self.direction.present?
    positions = positions.where(branch_id: self.branch_id) if self.branch_id.present?
    positions
  end

  def find_loadings
    loadings = Loading.active
    loadings = loadings.where(company_id: self.company_id) if self.company_id.present?
    #loadings = loadings.where(operation: self.operation) if self.operation.present?
    #loadings = loadings.where(direction: self.direction) if self.direction.present?
    loadings
  end

  def find_reservations
    reservations = Loading.active.reservation
    #reservations = reservations.where(operation: self.operation) if self.operation.present?
    #reservations = reservations.where(direction: self.direction) if self.direction.present?
    reservations = reservations.where('id not in (?)', self.session_loading_ids) if self.session_loading_ids.present?
    reservations
  end

  def find_companies
    if self.searched
      companies = Company.search(self.reference)
    else
      companies = Company.order(:name)
      companies = companies.where("lower(name) like ?", "%#{self.filter["reference"]}%") if self.filter["reference"].present?
      companies = companies.where(branch_id: self.filter["branch_id"]) if self.filter["branch_id"].present?
      companies = companies.where(country_id: self.filter["country_id"]) if self.filter["country_id"].present?
    end
    companies
  end

  def find_contacts
    if self.searched
      contacts = Contact.search(self.reference)
    else
    contacts  = Contact.order(:name, :surname)
    contacts  = contacts.where(company_id: self.filter["company_id"]) if self.filter["company_id"].present?
    contacts  = contacts.where("lower(name) like ?", "%#{self.filter["reference"]}%") if self.filter["reference"].present?
    end
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

  def find_vehicles
    vehicles = Vehicle.order(:code)
    vehicles = vehicles.where("code like ?", "%#{self.reference}%") if self.reference.present?
    vehicles = vehicles.where(created_at: self.docdate1..self.docdate2) if self.docdate1.present?
    vehicles
  end

  def find_wares
    if self.searched
      wares = Assetim::Ware.search(self.reference)
    else
      wares = Assetim::Ware.latest
      wares = wares.where("lower(name) like ?", "%#{self.reference.downcase}%") if self.reference.present?
    end
    wares
  end

  def find_tickets
    if self.searched
      tickets = Helpdesk::Ticket.search(self.reference)
    else
      tickets = Helpdesk::Ticket.latest
      tickets = tickets.where("title like ?", "%#{self.reference}%") if self.reference.present?
      tickets = tickets.where(user_id: self.user_id) if self.user_id.present?
    end
    tickets
  end

  def find_peoples
    if self.searched
      peoples = People.search(self.reference)
    else
      peoples = People.latest
      peoples = peoples.where("name||surname like ?", "%#{self.reference}%") if self.reference.present?
      peoples = peoples.where(user_id: self.user_id) if self.user_id.present?
    end
    peoples
  end
end