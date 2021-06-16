# https://techracho.bpsinc.jp/hachi8833/2021_04_22/107386

class SalesRepoert
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :start_date, :date
  attribute :end_date, :date
  attribute :min_items, :integer

  def run!
  end
end

report = SalesReport.new(start_date: '2020-01-01',end_date: '2020-01-02', min_items: '10')

report.start_date
