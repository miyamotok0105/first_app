# == Schema Information
#
# Table name: ibento
#

#

class Form::Ibento < Ibento
  REGISTRABLE_ATTRIBUTES = %i(register code name name_kana price purchase_cost)
  attr_accessor :register
end
